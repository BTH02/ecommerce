package com.example.ecommerce

import android.content.Intent
import android.os.Bundle
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import vn.zalopay.sdk.Environment
import vn.zalopay.sdk.ZaloPayError
import vn.zalopay.sdk.ZaloPaySDK
import vn.zalopay.sdk.listeners.PayOrderListener

class MainActivity : FlutterActivity() {
    // Merchant AppID For test
    private val appID: Int = 2554
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ZaloPaySDK.init(appID, Environment.SANDBOX)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        Log.d("newIntent", intent.toString())
        ZaloPaySDK.getInstance().onResult(intent)
        return
    }

    private val channelPayOrder: String = "com.example.flutter_zalopay/payOrder"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, channelPayOrder
        ).setMethodCallHandler { call, result ->
            if (call.method == "payOrder") {
                val token = call.argument<String>("zptoken")
                ZaloPaySDK.getInstance()
                    .payOrder(
                        this, token!!, "demozpdk://app",
                        object : PayOrderListener {
                            override fun onPaymentCanceled(
                                zpTransToken: String?,
                                appTransID: String?
                            ) {
                                result.error("❌❌❌ Payment Canceled", "failed", null)
                            }

                            override fun onPaymentError(
                                zaloPayErrorCode: ZaloPayError?,
                                zpTransToken: String?,
                                appTransID: String?
                            ) {
                                //Redirect to Zalo/ZaloPay Store when zaloPayError == ZaloPayError.PAYMENT_APP_NOT_FOUND
                                if (zaloPayErrorCode == ZaloPayError.PAYMENT_APP_NOT_FOUND) {
                                    ZaloPaySDK.getInstance()
                                        ?.navigateToZaloPayOnStore(applicationContext)
                                    return
                                }
                                result.error("❌❌❌ Payment failed", "failed", null)
                            }

                            override fun onPaymentSucceeded(
                                transactionId: String,
                                transToken: String,
                                appTransID: String?
                            ) {
                                result.success(true)
                            }
                        },
                    )
            } else {
                result.notImplemented()
            }
        }
    }
}

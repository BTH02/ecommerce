// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return _CreateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderRequest {
  @JsonKey(name: 'app_id')
  int get appId => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_user')
  String get appUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_trans_id')
  String get appTransId => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_time')
  int get appTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_duration_seconds')
  int? get expireDurationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'item')
  List<Item> get item => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'embed_data')
  EmbedData get embedData => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_code')
  String get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mac')
  String get mac => throw _privateConstructorUsedError;
  @JsonKey(name: 'callback_url')
  String? get callbackUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_info')
  String? get deviceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_app_id')
  String? get subAppId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderRequestCopyWith<$Res> {
  factory $CreateOrderRequestCopyWith(
          CreateOrderRequest value, $Res Function(CreateOrderRequest) then) =
      _$CreateOrderRequestCopyWithImpl<$Res, CreateOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'app_id') int appId,
      @JsonKey(name: 'app_user') String appUser,
      @JsonKey(name: 'app_trans_id') String appTransId,
      @JsonKey(name: 'app_time') int appTime,
      @JsonKey(name: 'expire_duration_seconds') int? expireDurationSeconds,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'item') List<Item> item,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'embed_data') EmbedData embedData,
      @JsonKey(name: 'bank_code') String bankCode,
      @JsonKey(name: 'mac') String mac,
      @JsonKey(name: 'callback_url') String? callbackUrl,
      @JsonKey(name: 'device_info') String? deviceInfo,
      @JsonKey(name: 'sub_app_id') String? subAppId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'currency') String? currency,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'address') String? address});

  $EmbedDataCopyWith<$Res> get embedData;
}

/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res, $Val extends CreateOrderRequest>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appUser = null,
    Object? appTransId = null,
    Object? appTime = null,
    Object? expireDurationSeconds = freezed,
    Object? amount = null,
    Object? item = null,
    Object? description = null,
    Object? embedData = null,
    Object? bankCode = null,
    Object? mac = null,
    Object? callbackUrl = freezed,
    Object? deviceInfo = freezed,
    Object? subAppId = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as String,
      appTransId: null == appTransId
          ? _value.appTransId
          : appTransId // ignore: cast_nullable_to_non_nullable
              as String,
      appTime: null == appTime
          ? _value.appTime
          : appTime // ignore: cast_nullable_to_non_nullable
              as int,
      expireDurationSeconds: freezed == expireDurationSeconds
          ? _value.expireDurationSeconds
          : expireDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      embedData: null == embedData
          ? _value.embedData
          : embedData // ignore: cast_nullable_to_non_nullable
              as EmbedData,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      callbackUrl: freezed == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      subAppId: freezed == subAppId
          ? _value.subAppId
          : subAppId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmbedDataCopyWith<$Res> get embedData {
    return $EmbedDataCopyWith<$Res>(_value.embedData, (value) {
      return _then(_value.copyWith(embedData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateOrderRequestImplCopyWith<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  factory _$$CreateOrderRequestImplCopyWith(_$CreateOrderRequestImpl value,
          $Res Function(_$CreateOrderRequestImpl) then) =
      __$$CreateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'app_id') int appId,
      @JsonKey(name: 'app_user') String appUser,
      @JsonKey(name: 'app_trans_id') String appTransId,
      @JsonKey(name: 'app_time') int appTime,
      @JsonKey(name: 'expire_duration_seconds') int? expireDurationSeconds,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'item') List<Item> item,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'embed_data') EmbedData embedData,
      @JsonKey(name: 'bank_code') String bankCode,
      @JsonKey(name: 'mac') String mac,
      @JsonKey(name: 'callback_url') String? callbackUrl,
      @JsonKey(name: 'device_info') String? deviceInfo,
      @JsonKey(name: 'sub_app_id') String? subAppId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'currency') String? currency,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'address') String? address});

  @override
  $EmbedDataCopyWith<$Res> get embedData;
}

/// @nodoc
class __$$CreateOrderRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderRequestCopyWithImpl<$Res, _$CreateOrderRequestImpl>
    implements _$$CreateOrderRequestImplCopyWith<$Res> {
  __$$CreateOrderRequestImplCopyWithImpl(_$CreateOrderRequestImpl _value,
      $Res Function(_$CreateOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? appUser = null,
    Object? appTransId = null,
    Object? appTime = null,
    Object? expireDurationSeconds = freezed,
    Object? amount = null,
    Object? item = null,
    Object? description = null,
    Object? embedData = null,
    Object? bankCode = null,
    Object? mac = null,
    Object? callbackUrl = freezed,
    Object? deviceInfo = freezed,
    Object? subAppId = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(_$CreateOrderRequestImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as int,
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as String,
      appTransId: null == appTransId
          ? _value.appTransId
          : appTransId // ignore: cast_nullable_to_non_nullable
              as String,
      appTime: null == appTime
          ? _value.appTime
          : appTime // ignore: cast_nullable_to_non_nullable
              as int,
      expireDurationSeconds: freezed == expireDurationSeconds
          ? _value.expireDurationSeconds
          : expireDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      embedData: null == embedData
          ? _value.embedData
          : embedData // ignore: cast_nullable_to_non_nullable
              as EmbedData,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      callbackUrl: freezed == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      subAppId: freezed == subAppId
          ? _value.subAppId
          : subAppId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderRequestImpl implements _CreateOrderRequest {
  _$CreateOrderRequestImpl(
      {@JsonKey(name: 'app_id') required this.appId,
      @JsonKey(name: 'app_user') required this.appUser,
      @JsonKey(name: 'app_trans_id') required this.appTransId,
      @JsonKey(name: 'app_time') required this.appTime,
      @JsonKey(name: 'expire_duration_seconds') this.expireDurationSeconds,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'item') required final List<Item> item,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'embed_data') required this.embedData,
      @JsonKey(name: 'bank_code') required this.bankCode,
      @JsonKey(name: 'mac') required this.mac,
      @JsonKey(name: 'callback_url') this.callbackUrl,
      @JsonKey(name: 'device_info') this.deviceInfo,
      @JsonKey(name: 'sub_app_id') this.subAppId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'currency') this.currency,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'address') this.address})
      : _item = item;

  factory _$CreateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: 'app_id')
  final int appId;
  @override
  @JsonKey(name: 'app_user')
  final String appUser;
  @override
  @JsonKey(name: 'app_trans_id')
  final String appTransId;
  @override
  @JsonKey(name: 'app_time')
  final int appTime;
  @override
  @JsonKey(name: 'expire_duration_seconds')
  final int? expireDurationSeconds;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  final List<Item> _item;
  @override
  @JsonKey(name: 'item')
  List<Item> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'embed_data')
  final EmbedData embedData;
  @override
  @JsonKey(name: 'bank_code')
  final String bankCode;
  @override
  @JsonKey(name: 'mac')
  final String mac;
  @override
  @JsonKey(name: 'callback_url')
  final String? callbackUrl;
  @override
  @JsonKey(name: 'device_info')
  final String? deviceInfo;
  @override
  @JsonKey(name: 'sub_app_id')
  final String? subAppId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'currency')
  final String? currency;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'address')
  final String? address;

  @override
  String toString() {
    return 'CreateOrderRequest(appId: $appId, appUser: $appUser, appTransId: $appTransId, appTime: $appTime, expireDurationSeconds: $expireDurationSeconds, amount: $amount, item: $item, description: $description, embedData: $embedData, bankCode: $bankCode, mac: $mac, callbackUrl: $callbackUrl, deviceInfo: $deviceInfo, subAppId: $subAppId, title: $title, currency: $currency, phone: $phone, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderRequestImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appUser, appUser) || other.appUser == appUser) &&
            (identical(other.appTransId, appTransId) ||
                other.appTransId == appTransId) &&
            (identical(other.appTime, appTime) || other.appTime == appTime) &&
            (identical(other.expireDurationSeconds, expireDurationSeconds) ||
                other.expireDurationSeconds == expireDurationSeconds) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.embedData, embedData) ||
                other.embedData == embedData) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.callbackUrl, callbackUrl) ||
                other.callbackUrl == callbackUrl) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.subAppId, subAppId) ||
                other.subAppId == subAppId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appId,
        appUser,
        appTransId,
        appTime,
        expireDurationSeconds,
        amount,
        const DeepCollectionEquality().hash(_item),
        description,
        embedData,
        bankCode,
        mac,
        callbackUrl,
        deviceInfo,
        subAppId,
        title,
        currency,
        phone,
        email,
        address
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      __$$CreateOrderRequestImplCopyWithImpl<_$CreateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderRequest implements CreateOrderRequest {
  factory _CreateOrderRequest(
          {@JsonKey(name: 'app_id') required final int appId,
          @JsonKey(name: 'app_user') required final String appUser,
          @JsonKey(name: 'app_trans_id') required final String appTransId,
          @JsonKey(name: 'app_time') required final int appTime,
          @JsonKey(name: 'expire_duration_seconds')
          final int? expireDurationSeconds,
          @JsonKey(name: 'amount') required final int amount,
          @JsonKey(name: 'item') required final List<Item> item,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'embed_data') required final EmbedData embedData,
          @JsonKey(name: 'bank_code') required final String bankCode,
          @JsonKey(name: 'mac') required final String mac,
          @JsonKey(name: 'callback_url') final String? callbackUrl,
          @JsonKey(name: 'device_info') final String? deviceInfo,
          @JsonKey(name: 'sub_app_id') final String? subAppId,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'currency') final String? currency,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'address') final String? address}) =
      _$CreateOrderRequestImpl;

  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: 'app_id')
  int get appId;
  @override
  @JsonKey(name: 'app_user')
  String get appUser;
  @override
  @JsonKey(name: 'app_trans_id')
  String get appTransId;
  @override
  @JsonKey(name: 'app_time')
  int get appTime;
  @override
  @JsonKey(name: 'expire_duration_seconds')
  int? get expireDurationSeconds;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'item')
  List<Item> get item;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'embed_data')
  EmbedData get embedData;
  @override
  @JsonKey(name: 'bank_code')
  String get bankCode;
  @override
  @JsonKey(name: 'mac')
  String get mac;
  @override
  @JsonKey(name: 'callback_url')
  String? get callbackUrl;
  @override
  @JsonKey(name: 'device_info')
  String? get deviceInfo;
  @override
  @JsonKey(name: 'sub_app_id')
  String? get subAppId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'currency')
  String? get currency;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'item_id')
  int get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_price')
  int get itemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_quantity')
  int get itemQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') int itemId,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'item_price') int itemPrice,
      @JsonKey(name: 'item_quantity') int itemQuantity});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? itemQuantity = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: null == itemQuantity
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') int itemId,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'item_price') int itemPrice,
      @JsonKey(name: 'item_quantity') int itemQuantity});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? itemQuantity = null,
  }) {
    return _then(_$ItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: null == itemQuantity
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {@JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'item_price') required this.itemPrice,
      @JsonKey(name: 'item_quantity') required this.itemQuantity});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final int itemId;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'item_price')
  final int itemPrice;
  @override
  @JsonKey(name: 'item_quantity')
  final int itemQuantity;

  @override
  String toString() {
    return 'Item(itemId: $itemId, itemName: $itemName, itemPrice: $itemPrice, itemQuantity: $itemQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            (identical(other.itemQuantity, itemQuantity) ||
                other.itemQuantity == itemQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, itemId, itemName, itemPrice, itemQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
          {@JsonKey(name: 'item_id') required final int itemId,
          @JsonKey(name: 'item_name') required final String itemName,
          @JsonKey(name: 'item_price') required final int itemPrice,
          @JsonKey(name: 'item_quantity') required final int itemQuantity}) =
      _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: 'item_id')
  int get itemId;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'item_price')
  int get itemPrice;
  @override
  @JsonKey(name: 'item_quantity')
  int get itemQuantity;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmbedData _$EmbedDataFromJson(Map<String, dynamic> json) {
  return _EmbedData.fromJson(json);
}

/// @nodoc
mixin _$EmbedData {
  @JsonKey(name: 'preferred_payment_method')
  List<String>? get preferredPaymentMethod =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'redirecturl')
  String? get redirectUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'zlppaymentid')
  String? get zlppaymentid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbedDataCopyWith<EmbedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbedDataCopyWith<$Res> {
  factory $EmbedDataCopyWith(EmbedData value, $Res Function(EmbedData) then) =
      _$EmbedDataCopyWithImpl<$Res, EmbedData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'preferred_payment_method')
      List<String>? preferredPaymentMethod,
      @JsonKey(name: 'redirecturl') String? redirectUrl,
      @JsonKey(name: 'zlppaymentid') String? zlppaymentid});
}

/// @nodoc
class _$EmbedDataCopyWithImpl<$Res, $Val extends EmbedData>
    implements $EmbedDataCopyWith<$Res> {
  _$EmbedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredPaymentMethod = freezed,
    Object? redirectUrl = freezed,
    Object? zlppaymentid = freezed,
  }) {
    return _then(_value.copyWith(
      preferredPaymentMethod: freezed == preferredPaymentMethod
          ? _value.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zlppaymentid: freezed == zlppaymentid
          ? _value.zlppaymentid
          : zlppaymentid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmbedDataImplCopyWith<$Res>
    implements $EmbedDataCopyWith<$Res> {
  factory _$$EmbedDataImplCopyWith(
          _$EmbedDataImpl value, $Res Function(_$EmbedDataImpl) then) =
      __$$EmbedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'preferred_payment_method')
      List<String>? preferredPaymentMethod,
      @JsonKey(name: 'redirecturl') String? redirectUrl,
      @JsonKey(name: 'zlppaymentid') String? zlppaymentid});
}

/// @nodoc
class __$$EmbedDataImplCopyWithImpl<$Res>
    extends _$EmbedDataCopyWithImpl<$Res, _$EmbedDataImpl>
    implements _$$EmbedDataImplCopyWith<$Res> {
  __$$EmbedDataImplCopyWithImpl(
      _$EmbedDataImpl _value, $Res Function(_$EmbedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredPaymentMethod = freezed,
    Object? redirectUrl = freezed,
    Object? zlppaymentid = freezed,
  }) {
    return _then(_$EmbedDataImpl(
      preferredPaymentMethod: freezed == preferredPaymentMethod
          ? _value._preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      zlppaymentid: freezed == zlppaymentid
          ? _value.zlppaymentid
          : zlppaymentid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbedDataImpl implements _EmbedData {
  _$EmbedDataImpl(
      {@JsonKey(name: 'preferred_payment_method')
      final List<String>? preferredPaymentMethod,
      @JsonKey(name: 'redirecturl') this.redirectUrl,
      @JsonKey(name: 'zlppaymentid') this.zlppaymentid})
      : _preferredPaymentMethod = preferredPaymentMethod;

  factory _$EmbedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbedDataImplFromJson(json);

  final List<String>? _preferredPaymentMethod;
  @override
  @JsonKey(name: 'preferred_payment_method')
  List<String>? get preferredPaymentMethod {
    final value = _preferredPaymentMethod;
    if (value == null) return null;
    if (_preferredPaymentMethod is EqualUnmodifiableListView)
      return _preferredPaymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'redirecturl')
  final String? redirectUrl;
  @override
  @JsonKey(name: 'zlppaymentid')
  final String? zlppaymentid;

  @override
  String toString() {
    return 'EmbedData(preferredPaymentMethod: $preferredPaymentMethod, redirectUrl: $redirectUrl, zlppaymentid: $zlppaymentid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbedDataImpl &&
            const DeepCollectionEquality().equals(
                other._preferredPaymentMethod, _preferredPaymentMethod) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.zlppaymentid, zlppaymentid) ||
                other.zlppaymentid == zlppaymentid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredPaymentMethod),
      redirectUrl,
      zlppaymentid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbedDataImplCopyWith<_$EmbedDataImpl> get copyWith =>
      __$$EmbedDataImplCopyWithImpl<_$EmbedDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbedDataImplToJson(
      this,
    );
  }
}

abstract class _EmbedData implements EmbedData {
  factory _EmbedData(
          {@JsonKey(name: 'preferred_payment_method')
          final List<String>? preferredPaymentMethod,
          @JsonKey(name: 'redirecturl') final String? redirectUrl,
          @JsonKey(name: 'zlppaymentid') final String? zlppaymentid}) =
      _$EmbedDataImpl;

  factory _EmbedData.fromJson(Map<String, dynamic> json) =
      _$EmbedDataImpl.fromJson;

  @override
  @JsonKey(name: 'preferred_payment_method')
  List<String>? get preferredPaymentMethod;
  @override
  @JsonKey(name: 'redirecturl')
  String? get redirectUrl;
  @override
  @JsonKey(name: 'zlppaymentid')
  String? get zlppaymentid;
  @override
  @JsonKey(ignore: true)
  _$$EmbedDataImplCopyWith<_$EmbedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

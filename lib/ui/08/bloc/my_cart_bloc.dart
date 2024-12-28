import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../base/bloc/bloc_status.dart';
import '../../../data/repositoires/zalo_repository.dart';
import '../../../l10n/generated/l10n.dart';

part 'my_cart_event.dart';

part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  MyCartBloc() : super(const MyCartState()) {
    on<CreateOrder>(_onCreateOrder);
  }

  final PaymentRepository _paymentRepository = PaymentRepository();

  Future<void> _onCreateOrder(
    CreateOrder event,
    Emitter<MyCartState> emit,
  ) async {
    try {
      // showLoading();

      final response = await _paymentRepository.createOrder(event.price);

      // hideLoading();
      if (response?.zpTransToken != null) {
        event.onSuccess?.call(response!.zpTransToken!);
      } else {
        Fluttertoast.showToast(msg: L.current.error_unknown);
      }
    } catch (_) {
      // hideLoading();
      Fluttertoast.showToast(msg: L.current.error_unknown);
    }
  }
}

import 'dart:developer';
import 'package:egy_exlpor/features/payment/data/models/payment_intent_input_model.dart';
import 'package:egy_exlpor/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:egy_exlpor/features/payment/presentation/manager/checkout_cubit/checkout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StripePaymentCubit extends Cubit<StripePaymentStates> {
  StripePaymentCubit() : super(StripePaymentInitialState());
  Future makePayment({required PaymentIntentInputModel paymentDetails}) async {
    emit(StripePaymentLoadingState());
    var data =
        await CheckoutRepoImpl().makePayment(paymentDetails: paymentDetails);
    data.fold((failure) {
      emit(StripePaymentErrorState(error: failure.error));
    }, (success) => emit(StripePaymentSuccessState()));
  }

  @override
  void onChange(Change<StripePaymentStates> change) {
    super.onChange(change);
    log(change.toString());
  }
}

abstract class StripePaymentStates {}

class StripePaymentInitialState extends StripePaymentStates {}

class StripePaymentLoadingState extends StripePaymentStates {}

class StripePaymentSuccessState extends StripePaymentStates {}

class StripePaymentErrorState extends StripePaymentStates {
  final String error;

  StripePaymentErrorState({required this.error});
}

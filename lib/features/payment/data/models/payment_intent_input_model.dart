class PaymentIntentInputModel {
  final String currency;
  final String amount;
  final String customerId;

  const PaymentIntentInputModel({
    required this.currency,
    required this.amount,
    required this.customerId,
  });

  toJson() {
    return {
      'amount': "${amount}00",
      'currency': currency,
      'customer': customerId,
    };
  }
}

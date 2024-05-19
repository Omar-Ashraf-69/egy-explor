class IntentPaymentsheetInputModel {
  final String customerId;
  final String clientSecret;
  final String ephemeralKeySecert;

  IntentPaymentsheetInputModel(
      {required this.customerId,
      required this.clientSecret,
      required this.ephemeralKeySecert});
}

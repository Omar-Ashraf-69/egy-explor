import 'details.dart';

class PaymentAmountModel {
  final String total;
  final String currency;
  final PaymentAmountDetailsModel details;

  PaymentAmountModel(
      {required this.total, required this.currency, required this.details});

  factory PaymentAmountModel.fromJson(Map<String, dynamic> json) {
    return PaymentAmountModel(
      total: json['total'] as String,
      currency: json['currency'] as String,
      details: PaymentAmountDetailsModel.fromJson(
          json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details.toJson(),
      };
}

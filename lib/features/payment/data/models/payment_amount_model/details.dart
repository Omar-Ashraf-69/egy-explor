class PaymentAmountDetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  PaymentAmountDetailsModel(
      {this.subtotal, this.shipping, this.shippingDiscount});

  factory PaymentAmountDetailsModel.fromJson(Map<String, dynamic> json) =>
      PaymentAmountDetailsModel(
        subtotal: json['subtotal'] as String?,
        shipping: json['shipping'] as String?,
        shippingDiscount: json['shipping_discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
}

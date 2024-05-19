import 'tip.dart';

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json['tip'] == null ? null : Tip(),
      );

  Map<String, dynamic> toJson() => {
        'tip': tip ?? '',
      };
}

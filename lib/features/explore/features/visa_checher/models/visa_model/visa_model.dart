import 'error.dart';

class VisaModel {
  final String passport;
  final String destination;
  String? dur;
  final String status;
  final String category;
  DateTime? lastUpdated;
  Error? error;

  VisaModel({
    required this.passport,
    required this.destination,
    this.dur,
    required this.status,
    required this.category,
    this.lastUpdated,
    this.error,
  });

  factory VisaModel.fromJson(Map<String, dynamic> json) => VisaModel(
        passport: json['passport'],
        destination: json['destination'],
        dur: json['dur'],
        status: json['status'],
        category: json['category'],
        lastUpdated: json['last_updated'] == null
            ? null
            : DateTime.parse(json['last_updated'] as String),
        error: json['error'] == null
            ? null
            : Error.fromJson(json['error'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'passport': passport,
        'destination': destination,
        'dur': dur,
        'status': status,
        'category': category,
        'last_updated': lastUpdated?.toIso8601String(),
        'error': error?.toJson(),
      };
}

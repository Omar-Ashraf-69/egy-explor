class Connector {
  String? id;

  Connector({this.id});

  factory Connector.fromJson(Map<String, dynamic> json) => Connector(
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

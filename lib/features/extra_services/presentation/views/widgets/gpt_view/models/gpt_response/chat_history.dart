class ChatHistory {
  String? role;
  String? message;

  ChatHistory({this.role, this.message});

  factory ChatHistory.fromJson(Map<String, dynamic> json) => ChatHistory(
        role: json['role'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'message': message,
      };
}

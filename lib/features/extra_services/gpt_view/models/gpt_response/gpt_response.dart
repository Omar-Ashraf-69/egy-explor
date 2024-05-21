import 'chat_history.dart';

class GptResponse {
  String? responseId;
  String? text;
  String? generationId;
  List<ChatHistory>? chatHistory;
  String? finishReason;

  GptResponse({
    this.responseId,
    this.text,
    this.generationId,
    this.chatHistory,
    this.finishReason,
  });

  factory GptResponse.fromJson(Map<String, dynamic> json) => GptResponse(
        responseId: json['response_id'] as String?,
        text: json['text'] as String?,
        generationId: json['generation_id'] as String?,
        chatHistory: (json['chat_history'] as List<dynamic>?)
            ?.map((e) => ChatHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
        finishReason: json['finish_reason'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'response_id': responseId,
        'text': text,
        'generation_id': generationId,
        'chat_history': chatHistory?.map((e) => e.toJson()).toList(),
        'finish_reason': finishReason,
      };
}

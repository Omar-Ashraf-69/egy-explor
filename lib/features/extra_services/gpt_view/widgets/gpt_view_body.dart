import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/api_keys.dart';
import 'package:egy_exlpor/core/utils/api_service.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/extra_services/gpt_view/models/gpt_response/gpt_response.dart';
import 'package:egy_exlpor/features/extra_services/gpt_view/widgets/chat_custom_appbar.dart';
import 'package:egy_exlpor/features/extra_services/gpt_view/widgets/chat_list_bluider.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GptViewBody extends StatefulWidget {
  const GptViewBody({super.key});

  @override
  State<GptViewBody> createState() => _GptViewBodyState();
}

class _GptViewBodyState extends State<GptViewBody> {
  List<Map<String, String>> messHistory = [];
  String message = '';
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatCustomAppBar(context),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: ChatListBuilder(
                  messages: messHistory,
                ),
              ),
              BlocBuilder<SpeechCubit, SpeechState>(
                builder: (context, state) {
                  if (state is SpeechListening) {
                    controller.text = state.recognizedWords;
                  } else if (state is SpeechError) {
                    controller.text = state.message;
                  }

                  return TextField(
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    controller: controller,
                    focusNode: focusNode,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: S.of(context).enterMessage,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      focusedBorder: customedBorder(),
                      enabledBorder: customedBorder(),
                      prefixIconColor: Colors.white,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<SpeechCubit, SpeechState>(
                            builder: (context, state) {
                              final speechCubit = context.read<SpeechCubit>();
                              return IconButton(
                                onPressed: () {
                                  if (speechCubit.isListening) {
                                    speechCubit.stopListening();
                                  } else {
                                    speechCubit.startListening();
                                  }
                                },
                                tooltip: 'Listen',
                                icon: Icon(
                                  speechCubit.isListening
                                      ? Icons.mic
                                      : Icons.mic_off,
                                  color: kPrimaryColor,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () async {
                              isLoading = true;
                              message = controller.text;
                              context.read<SpeechCubit>().deleteMessage();
                              controller.clear();
                              // controller.text = '';
                              messHistory.add({
                                'role': 'USER',
                                'message': message,
                              });
                              setState(() {});
                              controller.clear();
                              focusNode.unfocus();
                              await getResponse();
                              isLoading = false;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      suffixIconColor: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getResponse() async {
    Map<String, dynamic> reuquest = await ApiService(Dio()).post(
      url: 'https://api.cohere.ai/v1/chat',
      body: {
        "chat_history": messHistory,
        "message": message,
        "connectors": [
          {"id": "web-search"}
        ]
      },
      token: ApiKeys.gptkey,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ApiKeys.gptkey}'
      },
    );
    GptResponse response = GptResponse.fromJson(reuquest);
    log('response = $response');
    messHistory.add({
      'role': 'CHATBOT',
      'message': response.text ?? "",
    });
  }

  OutlineInputBorder customedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        color: kPrimaryColor,
      ),
    );
  }
}

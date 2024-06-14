import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeechToTextWidget extends StatelessWidget {
  const SpeechToTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechCubit, SpeechState>(
      builder: (context, state) {
        final speechCubit = context.read<SpeechCubit>();
        return BlocBuilder<GeminiCubit, GeminiState>(
          builder: (context, geminiState) {
            return IconButton(
              onPressed: geminiState is GeminiLoading
                  ? null
                  : () {
                      if (speechCubit.isListening) {
                        speechCubit.stopListening();
                      } else {
                        speechCubit.startListening();
                      }
                    },
              tooltip: 'Listen',
              icon: Icon(
                speechCubit.isListening ? Icons.mic : Icons.mic_off,
                color: kPrimaryColor,
              ),
            );
          },
        );
      },
    );
  }
}

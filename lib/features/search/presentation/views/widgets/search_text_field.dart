import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechCubit, SpeechState>(builder: (context, state) {
      if (state is SpeechListening) {
        controller.text = state.recognizedWords;
      } else if (state is SpeechError) {
        controller.text = state.message;
      }

      return TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: const Icon(Ionicons.search),
          hintText: hintText,
          hintStyle: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w800,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 35,
                child: VerticalDivider(
                  indent: 2,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: BlocBuilder<SpeechCubit, SpeechState>(
                  builder: (context, state) {
                    final speechCubit = context.read<SpeechCubit>();
                    return IconButton(
                      onPressed: () {
                        controller.clear();
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
                ),
              ),
            ],
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
              ? kWhiteColor
              : null,
        ),
      );
    });
  }
}

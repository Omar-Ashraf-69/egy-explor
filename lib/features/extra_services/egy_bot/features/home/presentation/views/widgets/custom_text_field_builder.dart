import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/widgets/custom_suffix_icon_builder.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldBuilder extends StatelessWidget {
  const CustomTextFieldBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechCubit, SpeechState>(
      builder: (context, state) {
        if (state is SpeechListening) {
          BlocProvider.of<GeminiCubit>(context).controller.text =
              state.recognizedWords;
        }
        return TextField(
          maxLines: null,
          keyboardType: TextInputType.text,
          controller: BlocProvider.of<GeminiCubit>(context).controller,
          focusNode: BlocProvider.of<GeminiCubit>(context).focusNode,
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
            suffixIcon: const CustomSuffixIconBuilder(),
            suffixIconColor: Colors.white,
          ),
        );
      },
    );
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

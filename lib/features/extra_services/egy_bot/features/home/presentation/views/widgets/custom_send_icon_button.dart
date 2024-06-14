import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSendIconButton extends StatelessWidget {
  const CustomSendIconButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPress(context),
      icon: const Icon(
        Icons.send,
        color: kPrimaryColor,
      ),
    );
  }

  void onPress(BuildContext context) async {
    if (BlocProvider.of<GeminiCubit>(context).controller.text.isNotEmpty) {
      BlocProvider.of<GeminiCubit>(context).message =
          BlocProvider.of<GeminiCubit>(context).controller.text;
      BlocProvider.of<GeminiCubit>(context).focusNode.unfocus();
      BlocProvider.of<GeminiCubit>(context).controller.clear();
      BlocProvider.of<GeminiCubit>(context).messHistory.add(
        {
          'role': 'USER',
          'message': BlocProvider.of<GeminiCubit>(context).message
        },
      );
      context.read<SpeechCubit>().deleteMessage();
      await BlocProvider.of<GeminiCubit>(context)
          .chat(message: BlocProvider.of<GeminiCubit>(context).message);
    }
  }
}

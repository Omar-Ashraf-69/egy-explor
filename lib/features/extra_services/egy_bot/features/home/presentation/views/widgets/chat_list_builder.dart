import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/widgets/chat_list_bluider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListBuilder extends StatelessWidget {
  const ChatListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeminiCubit, GeminiState>(
      builder: (context, state) {
        return Expanded(
          child: ChatListWidget(
            messages: BlocProvider.of<GeminiCubit>(context).messHistory,
          ),
        );
      },
    );
  }
}

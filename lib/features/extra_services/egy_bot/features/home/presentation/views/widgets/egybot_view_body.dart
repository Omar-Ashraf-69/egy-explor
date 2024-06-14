import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/widgets/chat_list_builder.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/widgets/custom_text_field_builder.dart';
import 'package:flutter/material.dart';

class EgyBotViewBody extends StatelessWidget {
  const EgyBotViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ChatListBuilder(),
            SizedBox(
              height: 4,
            ),
            CustomTextFieldBuilder(),
          ],
        ),
      ),
    );
  }
}

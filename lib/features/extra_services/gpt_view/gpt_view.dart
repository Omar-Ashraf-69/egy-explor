import 'package:egy_exlpor/features/extra_services/gpt_view/widgets/gpt_view_body.dart';
import 'package:flutter/material.dart';

class GptView extends StatelessWidget {
  const GptView({super.key});
  static const String routeName = '/GPT';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GptViewBody(),
    );
  }
}

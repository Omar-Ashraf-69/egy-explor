import 'package:egy_exlpor/features/extra_services/language_translation/widgets/translation_view_body.dart';
import 'package:flutter/material.dart';

class TranslationView extends StatelessWidget {
  const TranslationView({super.key});
  static const String routeName = '/language_translator';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        child: TranslationViewBody(),
      ),
    );
  }
}

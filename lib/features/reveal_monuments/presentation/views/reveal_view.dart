import 'package:egy_exlpor/features/reveal_monuments/presentation/views/widgets/reveal_view_body.dart';
import 'package:flutter/material.dart';

class RevealView extends StatelessWidget {
  const RevealView({super.key});
  static const String routeName = '/reveal_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RevealViewBody(),
    );
  }
}
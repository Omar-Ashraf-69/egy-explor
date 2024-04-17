import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/destination_view_body.dart';
import 'package:flutter/material.dart';

class DestinationView extends StatelessWidget {
  const DestinationView({super.key});
      static const String routeName = '/destination_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DestinationViewBody(),
    );
  }
}
import 'package:egy_exlpor/features/spot/presentation/views/widgets/spot_view_body.dart';
import 'package:flutter/material.dart';

class SpotView extends StatelessWidget {
  const SpotView({super.key});
  static const String routeName = "/spot_view";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpotViewBody(),
    );
  }
}

import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/details_section.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/top_view_part.dart';
import 'package:flutter/material.dart';

class DestinationViewBody extends StatelessWidget {
  const DestinationViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TopViewPart(),
            DetailsSection(),
          ],
        ),
      ),
    );
  }
}

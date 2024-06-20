import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class AboutDestinationPart extends StatelessWidget {
  const AboutDestinationPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "About Image",
            style: Styles.textStyle24.copyWith(),
          ),
        ),
        const SizedBox(height: 7),
        SizedBox(
          width: double.infinity,
          child: ReadMoreText(
            BlocProvider.of<ImageCubit>(context).description!,
            trimLines: 6,
            colorClickableText: kPrimaryColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Read More",
            moreStyle: Styles.textStyle14.copyWith(
              color: kPrimaryColor,
            ),
            lessStyle: Styles.textStyle14.copyWith(
              color: kPrimaryBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}

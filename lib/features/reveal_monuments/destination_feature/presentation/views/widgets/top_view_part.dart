import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopViewPart extends StatelessWidget {
  const TopViewPart({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          // CustomImageView(
          //   imagePath: 'assets/places/place1.jpg',
          //   width: double.infinity,
          // ),
          Image.file(
            BlocProvider.of<ImageCubit>(context).image!,
            width: double.infinity,
            height: 465,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 8, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      Icons.chevron_left_outlined,
                      color: kWhiteColor,
                    ),
                    pop: true,
                    color: Colors.grey.withOpacity(.33),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomRowBackArrow extends StatelessWidget {
  const CustomRowBackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
            const LoveIconWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/address_widget.dart';
import 'package:egy_exlpor/core/widgets/rate_widget.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:flutter/material.dart';

class PopularSpotWidget extends StatelessWidget {
  const PopularSpotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: SizedBox(
        width: 200,
        height: 170,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                AssetsData.imgRectangle18,
                height: 170,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 7,
              right: 10,
              child: LoveIconWidget(
                iconSize: 33,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sant Caterin",
                      style: Styles.textStyle14.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        AddressWidget(
                          color: kWhiteColor,
                          size: 10,
                        ),
                        const Spacer(),
                        RateWidget(
                          color: kWhiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
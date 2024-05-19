import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        leading: SvgPicture.asset(AssetHelper.masterCard),
        title: const Text(
          "Credit Card",
        ),
        subtitle: const Text("Master Card **12"),
      ),
    );
  }
}

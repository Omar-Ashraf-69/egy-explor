import 'package:egy_exlpor/core/utils/address_widget.dart';
import 'package:egy_exlpor/core/utils/spot_image.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/price_rate_widget.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/rate_widget.dart';
import 'package:flutter/material.dart';

class RecommendationCardItem extends StatelessWidget {
  const RecommendationCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        elevation: 0.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpotImage(),
                const SizedBox(height: 5),
                Text(
                  "St Regis Bora Bora",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const AddressWidget(),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PriceWidget(),
                    RateWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

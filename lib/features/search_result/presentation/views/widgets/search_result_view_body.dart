import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search_result/data/models/hotelcard_item_model.dart';
import 'package:egy_exlpor/features/search_result/presentation/views/widgets/hotelcard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            leading: const Padding(
              padding: EdgeInsets.all(6),
              child: CustomIconButton(
                icon: Icon(Icons.chevron_left_outlined),
                pop: true,
              ),
            ),
            centerTitle: true,
            title: Text(
              'Search Result',
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
            child: Column(
              children: [
                _buildRowprice(context),
                SizedBox(height: 16),
                _buildRowicbaseline(context),
                SizedBox(height: 24),
                _buildHotelcard(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprice(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kGreyColor,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    IconlyBold.location,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Cairo, Egypt",
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    // style: theme.textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Text(
                      "25 july to 27 july ",
                      style: Styles.textStyle12.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "| 2 Gests ",
                      style: Styles.textStyle12.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "| 3 rooms ",
                      style: Styles.textStyle12.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 3,
              bottom: 4,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconlyBroken.edit,
                  size: 22,
                  color: kPrimaryColor,
                ),
                Text(
                  "Edit",
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowicbaseline(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(Icons.sort),
        SizedBox(width: 4),
        Text(
          "Sort by",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: kGreyColor,
          ),
        ),
        Spacer(),
        Text(
          "Price (Low to High)",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildHotelcard(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return HotelcardItemWidget(
            HotelcardItemModel(),
          );
        },
      ),
    );
  }
}

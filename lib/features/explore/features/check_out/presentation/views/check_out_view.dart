import 'package:egy_exlpor/core/constants/color_palatte.dart';
import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/constants/textstyle_ext.dart';
import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/helpers/size_config.dart';
import 'package:egy_exlpor/core/models/room_model.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/app_bar_container.dart';
import 'package:egy_exlpor/features/explore/features/room/presentation/views/widgets/item_room_widget.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.roomModel});

  static const String routeName = '/checkout_screen';

  final RoomModel roomModel;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemOptionsCheckout(String icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: SizeConfig.screenWidth * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCheckOutStep(
    int step,
    String nameStep,
    bool isEnd,
    bool isCheck,
  ) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyles.defaultStyle.copyWith(
              color: isCheck ? null : Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        Text(nameStep,
            style: TextStyles.defaultStyle.fontCaption.whiteTextColor),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          const SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          const SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Checkout',
      child: Column(
        children: [
          Row(
            children: steps
                .map((e) => _buildItemCheckOutStep(
                    steps.indexOf(e) + 1,
                    e,
                    steps.indexOf(e) == steps.length - 1,
                    steps.indexOf(e) == 0))
                .toList(),
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemRoomWidget(roomModel: widget.roomModel, numberOfRoom: 1),
                  _buildItemOptionsCheckout(
                      AssetHelper.icoUser, 'Contact Details', 'Add Contact'),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildItemOptionsCheckout(
                      AssetHelper.icoPromo, 'Promo Code', 'Add Promo Code'),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemButtonWidget(
                    data: 'PayMent',
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LayoutView.routeName, (route) => false);
                      //Navigator.of(context).popUntil((route) => route.settings.name == MainApp.routeName);
                    },
                  ),
                  const SizedBox(
                    height: kMediumPadding,
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

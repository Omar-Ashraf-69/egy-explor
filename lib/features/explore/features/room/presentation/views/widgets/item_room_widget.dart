import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/constants/textstyle_ext.dart';
import 'package:egy_exlpor/core/models/room_model.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/dash_line.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/item_utility_hotel.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
import 'package:flutter/material.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({
    super.key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  });

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: Colors.white,
      ),
      margin:const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(roomModel.roomImage,
                    radius: BorderRadius.circular(kItemPadding)),
              ),
            ],
          ),
          const ItemUtilityHotelWidget(),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ItemButtonWidget(
                        data: 'Choose',
                        onTap: onTap,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

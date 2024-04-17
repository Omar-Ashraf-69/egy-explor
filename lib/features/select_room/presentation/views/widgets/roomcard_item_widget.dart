import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_image_view.dart';
import 'package:egy_exlpor/features/select_room/data/models/roomcard_item_model.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/room_details_part.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/room_title_widget.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/select_room_button.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class RoomCardItemWidget extends StatelessWidget {
  RoomCardItemWidget(this.roomcardItemModelObj, {super.key});

  RoomcardItemModel roomcardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: AssetsData.imgRectangle113,
            radius: BorderRadius.circular(12),
          ),
          RoomTitleWidget(
            roomTitle: roomcardItemModelObj.deluxedouble!,
          ),
          RoomDetailsPart(
            roomcardItemModelObj: roomcardItemModelObj,
          ),
          const SelectRoomButton(),
        ],
      ),
    );
  }
}

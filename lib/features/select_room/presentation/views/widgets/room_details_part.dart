import 'package:egy_exlpor/features/select_room/data/models/roomcard_item_model.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/room_details.dart';
import 'package:flutter/material.dart';

class RoomDetailsPart extends StatelessWidget {
  const RoomDetailsPart({super.key, required this.roomcardItemModelObj});
  final RoomcardItemModel roomcardItemModelObj;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoomDetailsRowWidget(
            imagePath: roomcardItemModelObj.roomImage!,
            price: roomcardItemModelObj.roomPrice!,
            rowText: roomcardItemModelObj.roomName!,
            isPriceRow: true,
          ),
          RoomDetailsRowWidget(
            imagePath: roomcardItemModelObj.guestsImage!,
            rowText: roomcardItemModelObj.guestsText!,
            price: roomcardItemModelObj.durationText!,
          ),
          RoomDetailsRowWidget(
            imagePath: roomcardItemModelObj.smokingImage!,
            rowText: roomcardItemModelObj.smokingText!,
          ),
        ],
      ),
    );
  }
}

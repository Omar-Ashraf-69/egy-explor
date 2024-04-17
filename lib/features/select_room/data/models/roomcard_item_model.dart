
// ignore_for_file: must_be_immutable

import 'package:egy_exlpor/core/utils/assets.dart';

class RoomcardItemModel {
  RoomcardItemModel(
      {this.deluxedouble,
      this.roomImage,
      this.roomName,
      this.roomPrice,
      this.guestsImage,
      this.guestsText,
      this.durationText,
      this.smokingImage,
      this.smokingText,
      this.detailsText,
      this.id}) {
    deluxedouble = deluxedouble ?? "Deluxe Double Bed With Balcony";
    roomImage = roomImage ?? AssetsData.imgRoom1;
    roomName = roomName ?? "01 Room";
    roomPrice = roomPrice ?? "\$85";
    guestsImage = guestsImage ?? AssetsData.imgProfileFill;
    guestsText = guestsText ?? "02 Guests";
    durationText = durationText ?? "(For 01 Night/Room)";
    smokingImage = smokingImage ?? AssetsData.imgSmokeFill;
    smokingText = smokingText ?? "Non-Smoking Room";
    detailsText = detailsText ?? "View More Details";
    id = id ?? "";
  }

  String? deluxedouble;

  String? roomImage;

  String? roomName;

  String? roomPrice;

  String? guestsImage;

  String? guestsText;

  String? durationText;

  String? smokingImage;

  String? smokingText;

  String? detailsText;

  String? id;
}

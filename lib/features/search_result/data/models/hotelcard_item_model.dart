import 'package:egy_exlpor/core/utils/assets.dart';



class HotelcardItemModel {
  HotelcardItemModel(
      {this.hotelImage,
      this.hotelName,
      this.ratingImage,
      this.ratingText,
      this.locationText,
      this.priceText,
      this.priceUnitText,
      this.favoriteImage,
      this.id}) {
    hotelImage = hotelImage ?? AssetsData.imgRectangle113;
    hotelName = hotelName ?? "Holy Park Hotel";
    ratingImage = ratingImage ?? AssetsData.imageFram;
    ratingText = ratingText ?? "4.8";
    locationText = locationText ?? "Nasr City, Cairo";
    priceText = priceText ?? "\$50";
    priceUnitText = priceUnitText ?? "/Room/Night";
    favoriteImage = favoriteImage ?? AssetsData.imgArrowUp;
    id = id ?? "";
  }

  String? hotelImage;

  String? hotelName;

  String? ratingImage;

  String? ratingText;

  String? locationText;

  String? priceText;

  String? priceUnitText;

  String? favoriteImage;

  String? id;
}

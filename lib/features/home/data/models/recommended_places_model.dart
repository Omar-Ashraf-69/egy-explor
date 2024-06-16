// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:egy_exlpor/core/utils/assets.dart';

class HiddenGemsModel {
  final String cityName;
  final String image;
  final double rating;
  final String location;
  final String bookingUrl;
  HiddenGemsModel({
    required this.cityName,
    required this.image,
    required this.rating,
    required this.location,
    required this.bookingUrl,
  });
}

//${Localizations.localeOf(context).languageCode}
List<HiddenGemsModel> hiddenGems = [
  HiddenGemsModel(
    cityName: "Cairo",
    image: AssetsData.cairoCity,
    rating: 4.8,
    location: "Cairo Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/cairo.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Aswan",
    image: AssetsData.aswanCity,
    rating: 4.7,
    location: "Aswan Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/aswan.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Luxor",
    image: AssetsData.luxorCity,
    rating: 4.8,
    location: "Luxor Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/luxor.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Alexandria",
    image: AssetsData.alexandriaCity,
    rating: 4.6,
    location: "Alexandria Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/alexandria.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Sharm El Sheikh",
    image: AssetsData.sharmElSheikhCity,
    rating: 4.8,
    location: "South Sinai Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/sherm-el-sheikh.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Dahab",
    image: AssetsData.dahabCity,
    rating: 4.9,
    location: "South Sinai Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/dhahab.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Hurghada",
    image: AssetsData.hurghadaCity,
    rating: 4.8,
    location: "Red Sea Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/al-ghardaqah.en-gb.html",
  ),
  HiddenGemsModel(
    cityName: "Marsa Alam",
    image: AssetsData.marsaAlamCity,
    rating: 4.4,
    location: "Red Sea Governorate",
    bookingUrl:
        "https://www.booking.com/attractions/searchresults/eg/marsa-alam.en-gb.html",
  ),
];

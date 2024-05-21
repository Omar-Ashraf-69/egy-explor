import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/hotel_booking_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/gest_and_room_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/select_date_view.dart';
import 'package:egy_exlpor/features/extra_services/currecny/ui/convert_currecny.dart';
import 'package:egy_exlpor/features/extra_services/currecny/ui/exchange_currecny.dart';
import 'package:egy_exlpor/features/extra_services/gpt_view/gpt_view.dart';
import 'package:egy_exlpor/features/favorites/presentation/views/favorites_view.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/hotel_view.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/destination_view.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/reveal_view.dart';
import 'package:egy_exlpor/features/search_result/presentation/views/search_result_view.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/select_room_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/search_view.dart';
import 'package:egy_exlpor/features/spot/presentation/views/spot_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingView.routeName: (context) => const OnBoardingView(),
  LayoutView.routeName: (context) => const LayoutView(),
  SelectDateView.routeName: (context) => SelectDateView(),
  GuestAndRoomView.routeName: (context) => const GuestAndRoomView(),
  HotelBookingView.routeName: (context) => const HotelBookingView(),
  NotificationView.routeName: (context) => const NotificationView(),
  SearchView.routeName: (context) => const SearchView(),
  FavoritesView.routeName: (context) => const FavoritesView(),
  RevealView.routeName: (context) => const RevealView(),
  DestinationView.routeName: (context) => const DestinationView(),
  SelectRoomView.routeName: (context) => const SelectRoomView(),
  HotelDetailsView.routeName: (context) => const HotelDetailsView(),
  SpotView.routeName: (context) => const SpotView(),
  SearchResultView.routeName: (context) => const SearchResultView(),
  GptView.routeName: (context) => const GptView(),
  CurrencyConverter.routeName: (context) => const CurrencyConverter(),
  ExchangeCurrecny.routeName: (context) => const ExchangeCurrecny(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelBookingView.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingView(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}

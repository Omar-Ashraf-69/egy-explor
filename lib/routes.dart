import 'package:egy_exlpor/core/models/hotel_model.dart';
import 'package:egy_exlpor/core/models/room_model.dart';
import 'package:egy_exlpor/features/explore/features/check_out/presentation/views/check_out_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/detail_hotel_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/hotel_booking_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/hotel_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/gest_and_room_view.dart';
import 'package:egy_exlpor/features/explore/features/room/presentation/views/room_view.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/select_date_view.dart';
import 'package:egy_exlpor/features/favorites/presentation/views/favorites_view.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
final Map<String, WidgetBuilder> routes = {
  HotelView.routeName: (context) =>const HotelView(),
  LayoutView.routeName:(context) =>const LayoutView(),
  SelectDateView.routeName: (context) => SelectDateView(),
  GuestAndRoomView.routeName: (context) =>const GuestAndRoomView(),
  RoomView.routeName: (context) => const RoomView(),
  HotelBookingView.routeName: (context) =>const HotelBookingView(),
  NotificationView.routeName: (context) =>const NotificationView(),
  SearchView.routeName: (context) =>const SearchView(),
  FavoritesView.routeName: (context) =>const FavoritesView(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelView.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelView(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutView.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutView(
          roomModel: roomModel,
        ),
      );

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

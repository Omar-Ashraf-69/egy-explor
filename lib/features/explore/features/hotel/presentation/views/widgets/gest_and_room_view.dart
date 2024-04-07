import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/app_bar_container.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/item_change_guest_and_room.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
import 'package:flutter/material.dart';

class GuestAndRoomView extends StatefulWidget {
  const GuestAndRoomView({super.key});

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomView> createState() => _GuestAndRoomViewState();
}

class _GuestAndRoomViewState extends State<GuestAndRoomView> {
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest =
      GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom =
      GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add guest and room',
      paddingContent:const EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.icoGuest,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.icoRoom,
            value: 'Room',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Done',
            onTap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}

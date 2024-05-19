import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/change_guest_and_room.dart';
import 'package:flutter/material.dart';

class GuestAndRoomView extends StatefulWidget {
  const GuestAndRoomView({super.key});

  static const String routeName = '/guest_and_room_view';

  @override
  State<GuestAndRoomView> createState() => _GuestAndRoomViewState();
}

class _GuestAndRoomViewState extends State<GuestAndRoomView> {
  final GlobalKey<ChangeGuestAndRoomState> _itemCountGuest =
      GlobalKey<ChangeGuestAndRoomState>();
  final GlobalKey<ChangeGuestAndRoomState> _itemCountRoom =
      GlobalKey<ChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add guest and room'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            ChangeGuestAndRoom(
              key: _itemCountGuest,
              initData: 1,
              icon: AssetHelper.icoGuest,
              value: 'Guest',
            ),
            ChangeGuestAndRoom(
              key: _itemCountRoom,
              initData: 1,
              icon: AssetHelper.icoRoom,
              value: 'Room',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtonWidget(
              label: Text(
                "Done",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop([
                  _itemCountGuest.currentState!.number,
                  _itemCountRoom.currentState!.number,
                ]);
              },
            ),
          ],
        ),
      ),
    );
    // return AppBarContainer(
    //   titleString: 'Add guest and room',
    //   paddingContent:const EdgeInsets.all(kMediumPadding),
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: kMediumPadding,
    //       ),
    //       ItemChangeGuestAndRoom(
    //         key: _itemCountGuest,
    //         initData: 1,
    //         icon: AssetHelper.icoGuest,
    //         value: 'Guest',
    //       ),
    //       ItemChangeGuestAndRoom(
    //         key: _itemCountRoom,
    //         initData: 1,
    //         icon: AssetHelper.icoRoom,
    //         value: 'Room',
    //       ),
    //       const SizedBox(
    //         height: kDefaultPadding,
    //       ),
    //       ItemButtonWidget(
    //         data: 'Done',
    //         onTap: () {
    //           Navigator.of(context).pop([
    //             _itemCountGuest.currentState!.number,
    //             _itemCountRoom.currentState!.number,
    //           ]);
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}

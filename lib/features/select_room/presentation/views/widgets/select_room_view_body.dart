import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/room_card_list_view.dart';
import 'package:flutter/material.dart';

class SelectRoomViewBody extends StatelessWidget {
  const SelectRoomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Scaffold(
          appBar: customAppBar(
            title: 'Select Room',
          ),
          body: const RoomCardListView(),
        ),
      ),
    );
  }
}

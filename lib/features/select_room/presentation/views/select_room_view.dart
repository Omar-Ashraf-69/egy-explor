import 'package:egy_exlpor/features/select_room/presentation/views/widgets/select_room_view_body.dart';
import 'package:flutter/material.dart';

class SelectRoomView extends StatelessWidget {
  const SelectRoomView({super.key});
  static const   String routeName = '/select_room_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SelectRoomViewBody(),
    );
  }
}
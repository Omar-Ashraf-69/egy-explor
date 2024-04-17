import 'package:egy_exlpor/features/select_room/presentation/views/select_room_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SelectRoomView(),
              ),
            );
          },
          child: const Icon(
            FontAwesomeIcons.hotel,
          ),
        ),
      ),
    );
  }
}

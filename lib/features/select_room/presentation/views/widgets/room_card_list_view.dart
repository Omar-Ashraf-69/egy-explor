import 'package:egy_exlpor/features/select_room/data/models/roomcard_item_model.dart';
import 'package:egy_exlpor/features/select_room/presentation/views/widgets/roomcard_item_widget.dart';
import 'package:flutter/material.dart';

class RoomCardListView extends StatelessWidget {
  const RoomCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 4,
        itemBuilder: (context, index) =>
            RoomCardItemWidget(RoomcardItemModel()),
      ),
    );
  }
}

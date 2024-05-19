import 'package:egy_exlpor/core/utils/spaces.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChangeGuestAndRoom extends StatefulWidget {
  const ChangeGuestAndRoom(
      {super.key, this.initData = 0, required this.icon, required this.value});

  final int initData;
  final String icon;
  final String value;

  @override
  State<ChangeGuestAndRoom> createState() => ChangeGuestAndRoomState();
}

class ChangeGuestAndRoomState extends State<ChangeGuestAndRoom> {
  late final TextEditingController _textEditingController;

  final FocusNode _focusNode = FocusNode();

  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            number = int.parse(_textEditingController.text);
          });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kTopPadding),
              color: Colors.white),
          margin: const EdgeInsets.only(bottom: kMediumPadding),
          padding: const EdgeInsets.all(kMediumPadding),
          child: Row(
            children: [
              ImageHelper.loadFromAsset(
                widget.icon,
              ),
              const SizedBox(
                width: kMediumPadding,
              ),
              Text(
                widget.value,
                style: Styles.textStyle18.copyWith(color: Colors.black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (number > 1) {
                    setState(() {
                      number--;
                      _textEditingController.text = number.toString();
                      if (_focusNode.hasFocus) {
                        _focusNode.unfocus();
                      }
                    });
                  }
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 60,
                padding: const EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  focusNode: _focusNode,
                  enabled: true,
                  autocorrect: false,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: 18,
                    ),
                  ),
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    number++;
                    _textEditingController.text = number.toString();
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                  });
                },
                child: const CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

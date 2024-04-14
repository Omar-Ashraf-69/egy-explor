import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoveIconWidget extends StatefulWidget {
  const LoveIconWidget({
    super.key,
  });

  @override
  State<LoveIconWidget> createState() => _LoveIconWidgetState();
}

class _LoveIconWidgetState extends State<LoveIconWidget> {
  bool? clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.33),
        shape: BoxShape.circle,
      ),
      width: 35,
      height: 35,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          clicked = !clicked!;
          setState(() {});
        },
        child: Icon(
          clicked! ? Icons.favorite : Ionicons.heart_outline,
          color: clicked! ? kPrimaryRedColor : Colors.white,
        ),
      ),
    );
  }
}

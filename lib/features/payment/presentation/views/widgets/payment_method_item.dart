import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    this.isActive = false,
    this.onTap,
  });
  final bool isActive;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(microseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                width: 1.5,
                color: isActive ? Colors.green : Colors.grey,
              ),
            ),
            shadows: [
              BoxShadow(
                  blurRadius: 4,
                  blurStyle: BlurStyle.outer,
                  color: isActive ? Colors.green : Colors.white,
                  offset: const Offset(0, 0),
                  spreadRadius: 0),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              height: 35,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}

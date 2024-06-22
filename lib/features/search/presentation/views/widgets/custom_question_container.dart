import 'package:flutter/material.dart';

class CustomQuestionContainer extends StatelessWidget {
  const CustomQuestionContainer({
    super.key,
    required this.title,
    this.isSelected = false,
  });
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 12, left: 12),
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.function});
  final String text;
  final IconData icon;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}


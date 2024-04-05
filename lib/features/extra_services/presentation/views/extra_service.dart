import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExtraServiceView extends StatelessWidget {
  const ExtraServiceView({super.key});
  final List<CardItem> items = const [
    CardItem(label: 'Map', icon: IconlyBold.location),
    CardItem(
      label: 'Weather Forcast',
      icon: FontAwesomeIcons.cloud,
    ),
    CardItem(label: 'Language Translator', icon: Icons.language_outlined),
    CardItem(
      label: 'Currency Converter',
      icon: Icons.currency_exchange_rounded,
    ),
    CardItem(
      label: 'Exchange Currency',
      icon: Icons.price_change_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Extra Services",
          style: Styles.textStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          itemBuilder: (context, index) {
            return CardItem(
              label: items[index].label,
              icon: items[index].icon,
            );
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        24,
      )),
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

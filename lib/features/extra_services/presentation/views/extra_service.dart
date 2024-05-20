import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/extra_services/presentation/views/widgets/gpt_view/gpt_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/l10n.dart';

class ExtraServiceView extends StatelessWidget {
  const ExtraServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CardItem> items = [
      const CardItem(
        label: ('GPT'),
        icon: IconlyBold.chat,
      ),
      CardItem(
        label: S.of(context).map,
        icon: IconlyBold.location,
      ),
      CardItem(
        label: S.of(context).weatherForcast,
        icon: FontAwesomeIcons.cloud,
      ),
      CardItem(
        label: S.of(context).languageTranslator,
        icon: Icons.language_outlined,
      ),
      CardItem(
        label: S.of(context).currenyConverter,
        icon: Icons.currency_exchange_rounded,
      ),
      CardItem(
        label: S.of(context).exchangeCurrency,
        icon: Icons.price_change_outlined,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).extraServices,
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
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, GptView.routeName);
              },
              child: CardItem(
                label: items[index].label,
                icon: items[index].icon,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
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

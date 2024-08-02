import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/extra_services/currecny/ui/convert_currecny.dart';
import 'package:egy_exlpor/features/extra_services/currecny/ui/exchange_currecny.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/managers/cubit/gemini_cubit_cubit.dart';
import 'package:egy_exlpor/features/extra_services/egy_bot/features/home/presentation/views/egybot_view.dart';
import 'package:egy_exlpor/features/extra_services/gpt_view/gpt_view.dart';
import 'package:egy_exlpor/features/extra_services/language_translation/translation_view.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/l10n.dart';

class ExtraServiceView extends StatelessWidget {
  const ExtraServiceView({super.key});
  static const String routeName = '/extraServiceView';
  @override
  Widget build(BuildContext context) {
    final List<CardItem> items = [
      const CardItem(
        label: ('IdeaMate'),
        icon: IconlyBold.chat,
      ),
      // CardItem(
      //   label: S.of(context).map,
      //   icon: IconlyBold.location,
      // ),
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
                if (items[index].label == S.of(context).weatherForcast) {
                  Navigator.pushNamed(context, WeatherView.routeName);
                  
                } else if (items[index].label ==
                    S.of(context).currenyConverter) {
                  Navigator.pushNamed(context, CurrencyConverter.routeName);
                } else if (items[index].label ==
                    S.of(context).exchangeCurrency) {
                  Navigator.pushNamed(context, ExchangeCurrecny.routeName);
                } else if (items[index].label == 'IdeaMate') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => SpeechCubit()..initialize(),
                          child: const GptView(),
                        ),
                      ));
                } else if (items[index].label ==
                    S.of(context).languageTranslator) {
                  Navigator.pushNamed(context, TranslationView.routeName);
                }
              },
              child: CardItem(
                label: items[index].label,
                icon: items[index].icon,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => GeminiCubit()),
                        BlocProvider(create: (context) => SpeechCubit()),
                      ],
                      child: const EgyptBotView(),
                    )),
          );
        },
        child: Image.asset(AssetsData.egyBotIcon),
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

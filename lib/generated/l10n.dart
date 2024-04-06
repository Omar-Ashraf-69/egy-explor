// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter localization`
  String get title {
    return Intl.message(
      'Flutter localization',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Life is Short and The world is `
  String get onBoardingPage1Title {
    return Intl.message(
      'Life is Short and The world is ',
      name: 'onBoardingPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `Wide`
  String get onBoardingPage1Suffix {
    return Intl.message(
      'Wide',
      name: 'onBoardingPage1Suffix',
      desc: '',
      args: [],
    );
  }

  /// `At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world`
  String get onBoardingPage1subTitle {
    return Intl.message(
      'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world',
      name: 'onBoardingPage1subTitle',
      desc: '',
      args: [],
    );
  }

  /// `People don't take trips trips take `
  String get onBoardingPage2Title {
    return Intl.message(
      'People don\'t take trips trips take ',
      name: 'onBoardingPage2Title',
      desc: '',
      args: [],
    );
  }

  /// `people`
  String get onBoardingPage2Suffix {
    return Intl.message(
      'people',
      name: 'onBoardingPage2Suffix',
      desc: '',
      args: [],
    );
  }

  /// `To get the best of your adventure you just need to leave and go where you like we are waiting for you`
  String get onBoardingPage2subTitle {
    return Intl.message(
      'To get the best of your adventure you just need to leave and go where you like we are waiting for you',
      name: 'onBoardingPage2subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStared {
    return Intl.message(
      'Get Started',
      name: 'getStared',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Egy Exlpor`
  String get splashTitle {
    return Intl.message(
      'Egy Exlpor',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

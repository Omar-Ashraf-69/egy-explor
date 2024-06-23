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

  /// `Welcome, `
  String get welcome {
    return Intl.message(
      'Welcome, ',
      name: 'welcome',
      desc: '',
      args: [],
    );
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get userName {
    return Intl.message(
      'UserName',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get loginNow {
    return Intl.message(
      'Login Now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// ` can't be empty.`
  String get cantBeEmpty {
    return Intl.message(
      ' can\'t be empty.',
      name: 'cantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Extra Services`
  String get extraServices {
    return Intl.message(
      'Extra Services',
      name: 'extraServices',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Previous Trip`
  String get previousTrip {
    return Intl.message(
      'Previous Trip',
      name: 'previousTrip',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profileDetials {
    return Intl.message(
      'Profile Details',
      name: 'profileDetials',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Weather Forcast`
  String get weatherForcast {
    return Intl.message(
      'Weather Forcast',
      name: 'weatherForcast',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Currency`
  String get exchangeCurrency {
    return Intl.message(
      'Exchange Currency',
      name: 'exchangeCurrency',
      desc: '',
      args: [],
    );
  }

  /// `language Translator`
  String get languageTranslator {
    return Intl.message(
      'language Translator',
      name: 'languageTranslator',
      desc: '',
      args: [],
    );
  }

  /// `Curreny Converter`
  String get currenyConverter {
    return Intl.message(
      'Curreny Converter',
      name: 'currenyConverter',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Reveal`
  String get reveal {
    return Intl.message(
      'Reveal',
      name: 'reveal',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Hidden Gems`
  String get hiddenGems {
    return Intl.message(
      'Hidden Gems',
      name: 'hiddenGems',
      desc: '',
      args: [],
    );
  }

  /// `Hot Spots`
  String get hotSpots {
    return Intl.message(
      'Hot Spots',
      name: 'hotSpots',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning, `
  String get goodMorning {
    return Intl.message(
      'Good Morning, ',
      name: 'goodMorning',
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

import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationViewBody extends StatefulWidget {
  const TranslationViewBody({super.key});

  @override
  State<TranslationViewBody> createState() => _TranslationViewBodyState();
}

class _TranslationViewBodyState extends State<TranslationViewBody> {
  TextEditingController text = TextEditingController();
  String translated = 'Translation';
  String translatedLanguage = 'Spanish';
  String originalLanguage = 'English';
  String fromLanguage = 'en';
  String toLanguage = 'es';
  final Map<String, String> supportedLanguages = {
    'af': 'Afrikaans',
    'sq': 'Albanian',
    'am': 'Amharic',
    'ar': 'Arabic',
    'hy': 'Armenian',
    'az': 'Azerbaijani',
    'eu': 'Basque',
    'be': 'Belarusian',
    'bn': 'Bengali',
    'bs': 'Bosnian',
    'bg': 'Bulgarian',
    'ca': 'Catalan',
    'ceb': 'Cebuano',
    'ny': 'Chichewa',
    'zh-cn': 'Chinese (Simplified)',
    'zh-tw': 'Chinese (Traditional)',
    'co': 'Corsican',
    'hr': 'Croatian',
    'cs': 'Czech',
    'da': 'Danish',
    'nl': 'Dutch',
    'en': 'English',
    'eo': 'Esperanto',
    'et': 'Estonian',
    'tl': 'Filipino',
    'fi': 'Finnish',
    'fr': 'French',
    'fy': 'Frisian',
    'gl': 'Galician',
    'ka': 'Georgian',
    'de': 'German',
    'el': 'Greek',
    'gu': 'Gujarati',
    'ht': 'Haitian Creole',
    'ha': 'Hausa',
    'haw': 'Hawaiian',
    'iw': 'Hebrew',
    'hi': 'Hindi',
    'hmn': 'Hmong',
    'hu': 'Hungarian',
    'is': 'Icelandic',
    'ig': 'Igbo',
    'id': 'Indonesian',
    'ga': 'Irish',
    'it': 'Italian',
    'ja': 'Japanese',
    'jw': 'Javanese',
    'kn': 'Kannada',
    'kk': 'Kazakh',
    'km': 'Khmer',
    'rw': 'Kinyarwanda',
    'ko': 'Korean',
    'ku': 'Kurdish (Kurmanji)',
    'ky': 'Kyrgyz',
    'lo': 'Lao',
    'la': 'Latin',
    'lv': 'Latvian',
    'lt': 'Lithuanian',
    'lb': 'Luxembourgish',
    'mk': 'Macedonian',
    'mg': 'Malagasy',
    'ms': 'Malay',
    'ml': 'Malayalam',
    'mt': 'Maltese',
    'mi': 'Maori',
    'mr': 'Marathi',
    'mn': 'Mongolian',
    'my': 'Myanmar (Burmese)',
    'ne': 'Nepali',
    'no': 'Norwegian',
    'or': 'Odia (Oriya)',
    'ps': 'Pashto',
    'fa': 'Persian',
    'pl': 'Polish',
    'pt': 'Portuguese',
    'pa': 'Punjabi',
    'ro': 'Romanian',
    'ru': 'Russian',
    'sm': 'Samoan',
    'gd': 'Scots Gaelic',
    'sr': 'Serbian',
    'st': 'Sesotho',
    'sn': 'Shona',
    'sd': 'Sindhi',
    'si': 'Sinhala',
    'sk': 'Slovak',
    'sl': 'Slovenian',
    'so': 'Somali',
    'es': 'Spanish',
    'su': 'Sundanese',
    'sw': 'Swahili',
    'sv': 'Swedish',
    'tg': 'Tajik',
    'ta': 'Tamil',
    'tt': 'Tatar',
    'te': 'Telugu',
    'th': 'Thai',
    'tr': 'Turkish',
    'tk': 'Turkmen',
    'uk': 'Ukrainian',
    'ur': 'Urdu',
    'ug': 'Uyghur',
    'uz': 'Uzbek',
    'vi': 'Vietnamese',
    'cy': 'Welsh',
    'xh': 'Xhosa',
    'yi': 'Yiddish',
    'yo': 'Yoruba',
    'zu': 'Zulu',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Translation"),
      body: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customDropDownButton(
                  buttonLabel: originalLanguage,
                  selectedLanguage: fromLanguage,
                  onLanguageChanged: (value) {
                    setState(() {
                      fromLanguage = value;
                      originalLanguage = supportedLanguages[value]!;
                      translate(text.text);
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  minLines: 1,
                  maxLines: null,
                  controller: text,
                  onChanged: translate,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter text',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                customDropDownButton(
                  buttonLabel: translatedLanguage,
                  selectedLanguage: toLanguage,
                  onLanguageChanged: (value) {
                    setState(() {
                      toLanguage = value;
                      translatedLanguage = supportedLanguages[value]!;
                      translate(text.text);
                    });
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  translated == '' ? 'Translation' : translated,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customDropDownButton({
    required String buttonLabel,
    required String selectedLanguage,
    required void Function(String) onLanguageChanged,
  }) {
    return DropdownButton<String>(
      hint: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonLabel,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: supportedLanguages.entries
          .map((entry) => DropdownMenuItem<String>(
                value: entry.key,
                child: Text(entry.value),
              ))
          .toList(),
      value: selectedLanguage,
      onChanged: (value) {
        if (value != null) {
          onLanguageChanged(value);
        }
      },
    );
  }

  void translate(String text) async {
    if (text.trim().isNotEmpty && fromLanguage != toLanguage) {
      try {
        final Translation translation = await text.translate(
          from: fromLanguage,
          to: toLanguage,
        );
        setState(() {
          translatedLanguage = translation.targetLanguage.name;
          originalLanguage = translation.sourceLanguage.name;
          translated = translation.text;
        });
      } catch (e) {
        // Handle the exception by showing an error message
        setState(() {
          translated = 'Error: Unable to translate';
        });
        // Optionally log the error or handle it in another way
        debugPrint(e.toString());
      }
    } else {
      setState(() {
        translated = '';
      });
    }
  }
}

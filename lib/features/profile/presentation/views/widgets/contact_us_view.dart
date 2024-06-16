import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});
  void launchWhatsapp({required String phone, required String message}) async {
    final String url = "https://wa.me/$phone/?text=$message";
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact Us",
          style: Styles.textStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get in Touch",
              style: Styles.textStyle30,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                "If you have any questions, please feel free to contact us. We will be happy to help you.",
                style: Styles.textStyle16,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomContactButton(
              icon: Icons.phone_outlined,
              text: "+201150913198",
              onPressed: () {
                // FlutterPhoneDirectCaller.callNumber("+201150913198");
                launchUrl(Uri.parse("tel:+201150913198"));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomContactButton(
              icon: Icons.mail_outline,
              text: "omarbondok62@gmail.com",
              onPressed: () {
                launchUrl(Uri.parse("mailto:omarbondok62@gmail.com"));
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Social Media',
              style: Styles.textStyle26,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_facebook,
              text: "Facebook",
              onTap: () {
                launchUrl(Uri.parse("https://www.facebook.com/omar.elqala.1"));
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_whatsapp,
              text: "Whatsapp",
              onTap: () {
                launchWhatsapp(phone: "+201150913198", message: "hello");
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomSocialMediaButton(
              icon: Icons.telegram_outlined,
              text: "Telegram",
              onTap: () {
                launchUrl(Uri.parse("https://t.me/bondoah"));
              },
            ),
          ],
        ),
      ),

      // body: Center(
      //   child: ElevatedButton(
      //       onPressed: () async {
      //         // launchUrl(Uri.parse("mailto:omarbondok62@gmail.com"));
      //         // launchUrl(Uri.parse("sms:+201150913198?body=hello"));
      //         // launchUrl(Uri.parse("tel:+201150913198"));
      //         // launchWhatsapp(phone: "+201150913198", message: "hello");
      //         // FlutterPhoneDirectCaller.callNumber("+201150913198");
      //       },
      //       child: const Text("Contact Us")),
      // ),
    );
  }
}

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          color: kWhiteColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: kBlackColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text, style: Styles.textStyle16.copyWith(color: kBlackColor))
          ],
        ),
      ),
    );
  }
}

class CustomContactButton extends StatelessWidget {
  const CustomContactButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
        foregroundColor: WidgetStateProperty.all(Colors.black),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(kWhiteColor),
      ),
      onPressed: onPressed,
      // onPressed:() {
      //   // FlutterPhoneDirectCaller.callNumber("+201150913198");
      //   launchUrl(Uri.parse("tel:+201150913198"));
      // },
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}

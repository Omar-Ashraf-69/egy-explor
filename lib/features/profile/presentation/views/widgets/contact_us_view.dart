import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/generated/l10n.dart';
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
        title: Text(
          S.of(context).contactUs,
          style: Styles.textStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).getInTouch,
              style: Styles.textStyle30,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                S.of(context).haveQuestion,
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
              height: 38,
            ),
            Text(
              S.of(context).socialMedia,
              style: Styles.textStyle26,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_facebook,
              text: S.of(context).facebook,
              onTap: () {
                launchUrl(Uri.parse("https://www.facebook.com/omar.elqala.1"));
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_whatsapp,
              text: S.of(context).whatsapp,
              onTap: () {
                launchWhatsapp(phone: "+201150913198", message: "hello");
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_linkedin,
              text: S.of(context).linkedin,
              onTap: () {
                launchUrl(Uri.parse(
                    "https://www.linkedin.com/in/omar-ashraf-a129bb1b5/"));
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomSocialMediaButton(
              icon: Ionicons.logo_github,
              text: S.of(context).github,
              onTap: () {
                launchUrl(Uri.parse("https://github.com/Omar-Ashraf-69"));
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

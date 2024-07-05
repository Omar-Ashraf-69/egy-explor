import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).resetPassword),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: AbsorbPointer(
          absorbing: isLoading,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).enterEmailtosendpasswordresetlink,
                  style: Styles.textStyle16,
                ),
                const SizedBox(height: 18),
                CustomTextField(
                  textEditingController: emailController,
                  prefixIcon: const Icon(Icons.email_outlined),
                  label: S.of(context).email,
                ),
                const SizedBox(height: 18),
                CustomButtonWidget(
                  label: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : Text(
                          S.of(context).sendEmail,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                  onTap: _sendResetPasswordEmail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendResetPasswordEmail() async {
    setState(() {
      isLoading = true;
    });

    if (formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Reset password link sent to your email",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
      Navigator.pop(context);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}

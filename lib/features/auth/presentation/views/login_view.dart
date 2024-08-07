import 'package:egy_exlpor/core/services/auth.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/auth/presentation/views/register_view.dart';
import 'package:egy_exlpor/features/auth/presentation/views/reset_password_view.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/app_name_widget.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_check_having_email_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/password_text_field_widget.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController passController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  bool isPass = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbsorbPointer(
        absorbing: isLoading,
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoWidget(),
                    const SizedBox(
                      height: 25,
                    ),
                    const AppNameWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textEditingController: emailController,
                      prefixIcon: const Icon(Icons.email_outlined),
                      label: S.of(context).email,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordTextField(
                      label: S.of(context).password,
                      controller: passController,
                      isPass: isPass,
                      onSuffixTap: () {
                        isPass = !isPass;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResetPasswordView()));
                              },
                              child: Text(
                                S.of(context).forgetPassword,
                                style: Styles.textStyle16
                                    .copyWith(color: kPrimaryColor),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButtonWidget(
                      label: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              S.of(context).login.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                      onTap: () async {
                        isLoading = true;
                        setState(() {});
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          await checkSignStatus();
                          if (result == 'success') {
                            isLoading = false;
                            setState(() {});
                            // ignore: use_build_context_synchronously
                            //(context).go(AppRouter.kHomeView);
                            Navigator.pushReplacement(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LayoutView(),
                                ));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                            isLoading = false;
                            setState(() {});
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomCheckHavingEmailWidget(
                      checkingMessage: S.of(context).dontHaveAccount,
                      actionMessage: S.of(context).registerNow,
                      onTap: () {
                        //(context).go(AppRouter.kRegisterView);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkSignStatus() async {
    result = await Authentication().signInWithEmailAndPassword(
      email: emailController.text,
      pass: passController.text,
    );
  }
}

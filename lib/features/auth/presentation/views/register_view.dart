import 'package:egy_exlpor/core/services/auth.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/app_name_widget.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_check_having_email_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/password_text_field_widget.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  bool isPass = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                      textEditingController: userNameController,
                      prefixIcon: const Icon(Icons.atm_outlined),
                      label: S.of(context).userName,
                    ),
                    const SizedBox(
                      height: 15,
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
                      height: 25,
                    ),
                    CustomButtonWidget(
                      label: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              S.of(context).register,
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
                          await checkRegisteringStatus();
                          if (result == 'success') {
                            isLoading = false;
                            setState(() {});
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
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                        isLoading = false;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomCheckHavingEmailWidget(
                      checkingMessage: S.of(context).alreadyHaveAccount,
                      actionMessage: S.of(context).loginNow,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                            (route) => false);
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

  Future<void> checkRegisteringStatus() async {
    result = await Authentication().createUserWithEmailAndPassword(
      email: emailController.text,
      pass: passController.text,
      userName: userNameController.text,
    );
  }
}

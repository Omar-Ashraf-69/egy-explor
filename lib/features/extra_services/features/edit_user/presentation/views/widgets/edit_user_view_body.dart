import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_state.dart';
import 'package:egy_exlpor/core/services/cloud.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  Uint8List? profilePic;
  bool isUpdating = false;
  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              title: const Text(
                "Profile Detials",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          profilePic == null
                              ? const CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      AssetImage(AssetsData.manPic),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundImage: MemoryImage(profilePic!),
                                ),
                          Positioned(
                            bottom: -10,
                            right: -10,
                            child: IconButton(
                              onPressed: () {
                                // Uint8List? file = await pickImage();
                                // setState(() {
                                //   profilePic = file;
                                // });
                              },
                              alignment: Alignment.bottomRight,
                              style: IconButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: Icon(
                                Icons.edit,
                                size: 22,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person_outline),
                      label: 'User Name',
                      hintText: state.user.userName,
                      textEditingController: userNameController,
                      isLabelSticked: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person_outline),
                      label: 'email',
                      hintText: state.user.email,
                      textEditingController: emailController,
                      isLabelSticked: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtonWidget(
                      label: isUpdating
                          ? Center(
                              child: CircularProgressIndicator(
                                color: kWhiteColor,
                              ),
                            )
                          : Text(
                              "Update".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kWhiteColor,
                              ),
                            ),
                      onTap: () async {
                        setState(() {
                          isUpdating = true;
                        });
                        await update(
                          userName: userNameController.text.isEmpty
                              ? state.user.userName
                              : userNameController.text,
                          file: profilePic,
                          uId: state.user.userId,
                          context: context,
                        );
                        setState(() {
                          isUpdating = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  update({
    required String userName,
    Uint8List? file,
    required String uId,
    required BuildContext context,
  }) async {
    String res = await CloudMethods().editProfile(
      uId: uId,
      userName: userName,
      file: file,
    );

    if (res == "success") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated")),
      );
      Navigator.of(context).pop();
    } else {
      throw Exception(res);
    }
    BlocProvider.of<UserCubit>(context).getUserDetails();
  }
}

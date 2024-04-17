import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/profile/features/edit_user/presentation/views/widgets/custom_image_view.dart';
import 'package:egy_exlpor/features/profile/features/edit_user/presentation/views/widgets/custom_text_form_field.dart';
import 'package:egy_exlpor/features/profile/features/edit_user/presentation/views/widgets/validate_phone.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  const CustomPhoneNumber({
    super.key,
    required this.country,
    required this.onTap,
    required this.controller,
    this.hintText,
  });

  final Country country;

  final Function(Country) onTap;
  final String? hintText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kWhiteColor
            : const Color(0xff2B2242),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 14,
                bottom: 14,
              ),
              child: Row(
                children: [
                  Text(
                    "+${country.phoneCode}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  CustomImageView(
                    imagePath: AssetsData.imgArrowUp,
                    height: 5,
                    width: 10,
                    color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
                        ? kWhiteColor
                        : null,
                    radius: BorderRadius.circular(
                      1,
                    ),
                    margin: const EdgeInsets.only(
                      left: 8,
                      top: 7,
                      bottom: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 5,
              ),
              child: CustomTextFormField(
                width: 256,
                controller: controller,
                hintText: hintText ?? 'Phone Number',
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (!isValidPhone(value)) {
                    return "err_msg_please_enter_valid_phone_number";
                  }
                  return null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            width: 60,
            child: Text(
              "+${country.phoneCode}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: const TextStyle(fontSize: 14),
            ),
          )
        ],
      );
  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14),
          ),
          isSearchable: true,
          title: const Text(
            'Select your phone code',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}

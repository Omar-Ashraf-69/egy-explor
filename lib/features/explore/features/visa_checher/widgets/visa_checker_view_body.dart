import 'dart:developer';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:egy_exlpor/core/utils/api_service.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/explore/features/visa_checher/models/visa_model/visa_model.dart';
import 'package:flutter/material.dart';

class VisaCheckerViewBody extends StatefulWidget {
  const VisaCheckerViewBody({super.key});

  @override
  State<VisaCheckerViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<VisaCheckerViewBody> {
  Country? country;
  bool isLoading = false;
  VisaModel? visa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Visa Checker'),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Image.asset(AssetsData.visaCheckerBackground),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () async {
              await _openCountryPicker(context);
              await printOutput();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Choose your nationality",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          if (country != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryPickerUtils.getDefaultFlagImage(country!),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  country!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 62,
          ),
          if (isLoading) const CircularProgressIndicator(),
          if (visa != null && !isLoading)
            Column(
              children: [
                Text(
                  visa!.category,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: visa!.status == "VR" ? Colors.red : Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      visa!.status == "VR" ? Colors.red : Colors.green,
                  child: Icon(
                    visa!.status == "VR" ? Icons.cancel : Icons.check,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> printOutput() async {
    isLoading = true;
    Map<String, dynamic> response = await ApiService(Dio()).get(
      url: 'https://rough-sun-2523.fly.dev/api/${country!.isoCode}/eg',
      token: null,
    );

    isLoading = false;
    VisaModel visaModel = VisaModel.fromJson(response);
    setState(() {
      visa = visaModel;
    });
  }

  Future<void> _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14),
          ),
          isSearchable: true,
          title: const Text(
            'Select your Country code',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          onValuePicked: (Country country) {
            setState(() {
              this.country = country;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            width: 60,
            child: Text(
              country.isoCode,
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
}

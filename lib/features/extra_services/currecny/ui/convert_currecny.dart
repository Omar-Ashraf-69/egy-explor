import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/extra_services/currecny/model/currency_model.dart';
import 'package:egy_exlpor/features/extra_services/currecny/service/currency_api_service.dart';
import 'package:egy_exlpor/features/extra_services/currecny/ui/components/all_currency_listitem.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});
  static const String routeName = '/ConvertCurrecny';

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  CurrecnyApiService apiService = CurrecnyApiService();
  String _selectedCurrency = "USD";

  Widget _buildCurrencyDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${country.currencyName}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Currecny Converter'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Base Currency",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: CountryPickerDropdown(
                initialValue: 'us',
                itemBuilder: _buildCurrencyDropdownItem,
                onValuePicked: (Country? country) {
                  setState(() {
                    _selectedCurrency = country?.currencyCode ?? "";
                  });
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "All Currency",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: FutureBuilder<List<CurrencyModel>>(
                future: apiService.getLatest(_selectedCurrency),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CurrencyModel> currencyModelList = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: currencyModelList.length,
                      itemBuilder: (context, index) {
                        return AllCurrencyListItem(
                          currencyModel: currencyModelList[index],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error occurred"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

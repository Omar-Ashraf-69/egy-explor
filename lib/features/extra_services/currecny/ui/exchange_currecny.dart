import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/extra_services/currecny/service/currency_api_service.dart';
import 'package:flutter/material.dart';

class ExchangeCurrecny extends StatefulWidget {
  const ExchangeCurrecny({super.key});
  static const String routeName = '/ExchangeCurrecny';

  @override
  State<ExchangeCurrecny> createState() => _ExchangeCurrecnyState();
}

class _ExchangeCurrecnyState extends State<ExchangeCurrecny> {
  String _selectedBaseCurrency = "USD";
  String _selectedTargetCurrency = "EGP";
  final _textController = TextEditingController();
  String _exchangeRate = "";
  CurrecnyApiService apiService = CurrecnyApiService();

  bool isVisible = false;

  Widget _buildCurrencyDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "${country.currencyName}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Exchange Currecny'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Base Currency",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(10)),
                        child: CountryPickerDropdown(
                          initialValue: 'us',
                          itemBuilder: _buildCurrencyDropdownItem,
                          onValuePicked: (Country? country) {
                            setState(() {
                              isVisible = false;
                              _selectedBaseCurrency =
                                  country?.currencyCode ?? "";
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _textController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        "Target Currency",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10)),
                        child: CountryPickerDropdown(
                          initialValue: 'EG',
                          itemBuilder: _buildCurrencyDropdownItem,
                          onValuePicked: (Country? country) {
                            setState(() {
                              isVisible = false;
                              _selectedTargetCurrency =
                                  country?.currencyCode ?? "";
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blue,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_textController.text.isNotEmpty) {
                              await apiService
                                  .getExchange(_selectedBaseCurrency,
                                      _selectedTargetCurrency)
                                  .then((result) {
                                isVisible = true;
                                double value = double.parse(
                                    _textController.text.toString());
                                double exchangeRate =
                                    double.parse(result[0].value.toString());
                                double total = value * exchangeRate;

                                _exchangeRate =
                                    total.toStringAsFixed(2).toString();
                                setState(() {});
                              });
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Text(
                              "Exchange",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      if (isVisible)
                        Text(
                          "$_exchangeRate $_selectedTargetCurrency",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 48,
                            color: Colors.blue,
                          ),
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

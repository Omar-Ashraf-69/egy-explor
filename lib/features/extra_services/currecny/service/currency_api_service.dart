import 'dart:convert';

import 'package:egy_exlpor/features/extra_services/currecny/model/currency_model.dart';
import 'package:http/http.dart' as http;
import 'package:egy_exlpor/core/utils/api_keys.dart';

class CurrecnyApiService {
  Future<List<CurrencyModel>> getLatest(String baseCurrrency) async {
    List<CurrencyModel> currencyModelList = [];
    const baseUrl = "https://api.currencyapi.com/v3/";

    String url =
        '${baseUrl}latest?apikey=${ApiKeys.currencyApikey}&base_currency=$baseCurrrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          CurrencyModel currencyModel = CurrencyModel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CurrencyModel>> getExchange(
      String baseCurrrency, String targetCurrency) async {
    List<CurrencyModel> currencyModelList = [];
    const baseUrl = "https://api.currencyapi.com/v3/";

    String url =
        '${baseUrl}latest?apikey=${ApiKeys.currencyApikey}&base_currency=$baseCurrrency&currencies=$targetCurrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Map<String, dynamic> body = json['data'];

        body.forEach((key, value) {
          CurrencyModel currencyModel = CurrencyModel.fromJson(value);
          currencyModelList.add(currencyModel);
        });
        return currencyModelList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

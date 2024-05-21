import 'package:egy_exlpor/features/extra_services/currecny/model/currency_model.dart';
import 'package:flutter/material.dart';

class AllCurrencyListItem extends StatelessWidget {
  final CurrencyModel currencyModel;

  const AllCurrencyListItem({super.key, required this.currencyModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currencyModel.code.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            currencyModel.value?.toStringAsFixed(2).toString() ?? "",
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

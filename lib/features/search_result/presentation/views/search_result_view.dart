import 'package:egy_exlpor/features/search_result/presentation/views/widgets/search_result_view_body.dart';
import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});
  static const String routeName = '/search_result_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchResultViewBody(),
    );
  }
}
import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String routeName = '/search_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechCubit()..initialize(),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}

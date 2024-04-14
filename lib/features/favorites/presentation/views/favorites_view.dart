import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  static const String routeName = '/favorites_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesViewBody(),
    );
  }
}

import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_grid_view.dart';
import 'package:flutter/material.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Favorites',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FavoritesGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

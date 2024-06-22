import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_cubit.dart';
import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_state.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

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
          body: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              BlocProvider.of<FavoritesCubit>(context).getFavorites();
              if (state is FavoritesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FavoritesLoaded) {
                if (state.favorites.isEmpty) {
                  return const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No favorites.",
                        style: Styles.textStyle24,
                      ),
                      Icon(Ionicons.sad_outline),
                    ],
                  ));
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      FavoritesGridView(
                        favorites: state.favorites,
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                    child: Text(
                  "Get Some Favorites First.",
                  style: Styles.textStyle24,
                ));
              }
            },
          ),
        ));
    //     body: const Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: 10),
    //           FavoritesGridView(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

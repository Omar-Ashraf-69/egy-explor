import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_cubit.dart';
import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_state.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class LoveIconWidget extends StatefulWidget {
  const LoveIconWidget({
    super.key,
    this.iconSize,
    this.place,
  });
  final double? iconSize;
  final TopPlaces? place;
  @override
  State<LoveIconWidget> createState() => _LoveIconWidgetState();
}

class _LoveIconWidgetState extends State<LoveIconWidget> {
  bool? clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.33),
        shape: BoxShape.circle,
      ),
      width: widget.iconSize ?? 30,
      height: widget.iconSize ?? 30,
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          bool isFavorite = false;
          if (state is FavoritesLoaded) {
            isFavorite = state.favorites.contains(widget.place);
          }

          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              if (isFavorite) {
                context.read<FavoritesCubit>().removeFavorite(widget.place!);
              } else {
                context.read<FavoritesCubit>().addFavorite(widget.place!);
              }
            },
            child: Icon(
              isFavorite ? Icons.favorite : Ionicons.heart_outline,
              color: isFavorite ? kPrimaryRedColor : Colors.white,
            ),
          );
        },
      ),
    );
  }
}

import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_state.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  List<TopPlaces> places = [];

  void addFavorite(TopPlaces place) {
    // final currentState = state;
    // if (currentState is FavoritesLoaded) {
    //   emit(FavoritesLoaded(List.from(currentState.favorites)..add(place)));
    // } else {
    //   emit(FavoritesLoaded([place]));
    // }
    emit(FavoritesLoading());
    if (!places.contains(place)) {
      places.add(place);
      emit(FavoritesLoaded(places));
    }
  }

  void removeFavorite(TopPlaces place) {
    emit(FavoritesLoading());
    if (places.contains(place)) {
      places.remove(place);
      emit(FavoritesLoaded(places));
    }
  }

  void getFavorites() {
    emit(FavoritesLoading());
    emit(FavoritesLoaded(places));
  }

  void loadFavorites() {
    emit(FavoritesLoading());
    emit(FavoritesLoaded(places));
  }
}

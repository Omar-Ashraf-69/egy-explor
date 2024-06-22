import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<TopPlaces> favorites;

  const FavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

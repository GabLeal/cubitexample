import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';

abstract class FavoritesState {}

class EmptyFavoritesState implements FavoritesState {}

class MovieHasAlreadyBeenFavorited implements FavoritesState {
  String get message => 'Esse filme já foi adicionado aos favoritos';
}

class MoviesFavoritesState implements FavoritesState {
  final List<MovieEntity> movies;
  MoviesFavoritesState(this.movies);
}

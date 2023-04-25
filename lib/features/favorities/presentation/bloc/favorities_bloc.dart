import 'package:cubit_example/features/favorities/presentation/bloc/favorities_state.dart';
import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Cubit<FavoritesState> {
  FavoritesBloc() : super(EmptyFavoritesState());

  final List<MovieEntity> _movies = [];

  void addFavorite(MovieEntity movie) {
    if (_movies.contains(movie)) {
      emit(MovieHasAlreadyBeenFavorited());
      return;
    } else {
      _movies.add(movie);
    }

    emit(MoviesFavoritesState(_movies));
  }

  void removeFavorite(MovieEntity movie) {
    _movies.removeWhere((item) {
      return item.id == movie.id;
    });
    if (_movies.isEmpty) {
      emit(EmptyFavoritesState());
      return;
    }
    emit(MoviesFavoritesState(_movies));
  }
}

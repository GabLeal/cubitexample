import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesState {}

class DefaultMoviesState implements MoviesState {}

class LoadingMoviesState implements MoviesState {}

class SuccessMoviesState implements MoviesState {
  final List<MovieEntity> movies;
  SuccessMoviesState(this.movies);
}

class ErrorMoviesState implements MoviesState {}

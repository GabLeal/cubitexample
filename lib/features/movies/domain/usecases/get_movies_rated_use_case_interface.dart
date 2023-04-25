import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';

abstract class IGetMoviesRatedUseCase {
  Future<List<MovieEntity>> get();
}

import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';

abstract class IGetMoviesRatedRepository {
  Future<List<MovieEntity>> get();
}

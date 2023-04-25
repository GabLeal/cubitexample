import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';
import 'package:cubit_example/features/movies/domain/repositories/get_movies_rated_repository_interface.dart';
import 'package:cubit_example/features/movies/domain/usecases/get_movies_rated_use_case_interface.dart';

class GetMoviesRatedUseCase implements IGetMoviesRatedUseCase {
  final IGetMoviesRatedRepository _getMoviesRatedRepository;

  GetMoviesRatedUseCase(this._getMoviesRatedRepository);
  @override
  Future<List<MovieEntity>> get() async {
    return await _getMoviesRatedRepository.get();
  }
}

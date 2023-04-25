import 'package:cubit_example/features/movies/data/get_movies_rated_http_repository.dart';
import 'package:cubit_example/features/movies/domain/repositories/get_movies_rated_repository_interface.dart';
import 'package:cubit_example/features/movies/domain/usecases/get_movies_rated_use_case.dart';
import 'package:cubit_example/features/movies/domain/usecases/get_movies_rated_use_case_interface.dart';
import 'package:cubit_example/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class MoviesInjection {
  static final getIt = GetIt.instance;
  static void initializeDependencies() {
    getIt.registerFactory<Dio>(
      () => Dio(),
    );

    getIt.registerFactory<IGetMoviesRatedRepository>(
      () => GetMoviesRatedHttpRepository(
        GetIt.I<Dio>(),
      ),
    );

    getIt.registerFactory<IGetMoviesRatedUseCase>(
      () => GetMoviesRatedUseCase(
        GetIt.I<IGetMoviesRatedRepository>(),
      ),
    );

    getIt.registerFactory<MoviesBloc>(
      () => MoviesBloc(
        GetIt.I<IGetMoviesRatedUseCase>(),
      ),
    );
  }
}

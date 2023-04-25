import 'package:cubit_example/features/movies/domain/usecases/get_movies_rated_use_case_interface.dart';
import 'package:cubit_example/features/movies/presentation/bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Cubit<MoviesState> {
  final IGetMoviesRatedUseCase _getMoviesRatedUseCase;

  MoviesBloc(this._getMoviesRatedUseCase) : super(DefaultMoviesState());

  Future<void> getMovies() async {
    emit(LoadingMoviesState());
    final result = await _getMoviesRatedUseCase.get();

    if (result.isNotEmpty) {
      emit(SuccessMoviesState(result));
    } else {
      emit(ErrorMoviesState());
    }
  }
}

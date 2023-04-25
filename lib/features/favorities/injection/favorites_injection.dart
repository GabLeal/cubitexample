import 'package:cubit_example/features/favorities/presentation/bloc/favorities_bloc.dart';
import 'package:get_it/get_it.dart';

class FavoritesInjection {
  static final getIt = GetIt.instance;
  static void initializeDependencies() {
    getIt.registerLazySingleton<FavoritesBloc>(
      () => FavoritesBloc(),
    );
  }
}

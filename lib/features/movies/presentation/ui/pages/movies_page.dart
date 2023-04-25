import 'package:cubit_example/features/favorities/presentation/bloc/favorities_bloc.dart';
import 'package:cubit_example/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:cubit_example/features/movies/presentation/bloc/movies_state.dart';
import 'package:cubit_example/features/movies/presentation/ui/widgets/favorite_button.dart';
import 'package:cubit_example/shared/widgtes/card_movie/card_movie.dart';
import 'package:cubit_example/shared/widgtes/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc moviesBloc = GetIt.I<MoviesBloc>();
  FavoritesBloc favoritesBloc = GetIt.I<FavoritesBloc>();

  @override
  void initState() {
    moviesBloc.getMovies();
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E19),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1D28),
        title: const Text('Filmes'),
        actions: const [
          FavoriteButton(),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xFFF6B500),
        onRefresh: () async {
          moviesBloc.getMovies();
        },
        child: BlocBuilder<MoviesBloc, MoviesState>(
            bloc: moviesBloc,
            builder: (context, state) {
              if (state is ErrorMoviesState) {
                return const Center(
                  child: Text('Erro na api'),
                );
              }

              if (state is SuccessMoviesState) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            favoritesBloc.addFavorite(state.movies[index]);
                          },
                          child: CardMovie(
                            movie: state.movies[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return const Center(
                child: MovieXLoading(),
              );
            }),
      ),
    );
  }
}

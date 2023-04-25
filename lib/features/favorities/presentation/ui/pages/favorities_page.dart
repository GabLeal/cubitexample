import 'package:cubit_example/features/favorities/presentation/bloc/favorities_bloc.dart';
import 'package:cubit_example/features/favorities/presentation/bloc/favorities_state.dart';
import 'package:cubit_example/shared/widgtes/card_movie/card_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FavoritiesPage extends StatefulWidget {
  const FavoritiesPage({super.key});

  @override
  State<FavoritiesPage> createState() => _FavoritiesPageState();
}

class _FavoritiesPageState extends State<FavoritiesPage> {
  FavoritesBloc favoritesBloc = GetIt.I<FavoritesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: const Color(0xFF1D1D28),
      ),
      backgroundColor: const Color(0xFF0F0E19),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          bloc: favoritesBloc,
          builder: (context, state) {
            if (state is MoviesFavoritesState) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: Dismissible(
                      key: UniqueKey(),
                      background: _backgroundDimissible(),
                      secondaryBackground: _backgroundDimissible(),
                      onDismissed: (DismissDirection direction) {
                        favoritesBloc.removeFavorite(state.movies[index]);
                      },
                      child: CardMovie(
                        movie: state.movies[index],
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: Text(
                'Você ainda não tem nenhum filme como favorito.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _backgroundDimissible() {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'Delete',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

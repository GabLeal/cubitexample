import 'package:cubit_example/features/favorities/presentation/bloc/favorities_bloc.dart';
import 'package:cubit_example/features/favorities/presentation/bloc/favorities_state.dart';
import 'package:cubit_example/shared/widgtes/custom_snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  FavoritesBloc favoritesBloc = GetIt.I<FavoritesBloc>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/favorities');
          },
        ),
        BlocConsumer<FavoritesBloc, FavoritesState>(
          bloc: favoritesBloc,
          listener: (context, state) {
            if (state is MovieHasAlreadyBeenFavorited) {
              CustomSnackBar.showErrorSnackBar(state.message);
            }

            if (state is MoviesFavoritesState) {
              CustomSnackBar.showSuccessSnackBar('O filme foi favoritado.');
            }
          },
          builder: (context, state) {
            if (state is MoviesFavoritesState) {
              return Positioned(
                right: 10,
                bottom: 10,
                child: Center(
                  child: Text(
                    state.movies.length.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF6B500),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

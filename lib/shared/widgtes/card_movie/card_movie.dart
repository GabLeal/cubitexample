import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';
import 'package:cubit_example/shared/widgtes/cache_network_image/cache_network_image.dart';
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  final MovieEntity movie;
  const CardMovie({
    required this.movie,
    super.key,
  });

  final styleText = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // border: Border.all(color: ),
            // color: const Color(0xFF20212D),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1D1D28),
                Color(0xFF15151F),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          width: size.width,
          height: 180,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            child: Row(
              children: [
                MovieXCachedNetworkImage(
                  pathImage:
                      'http://image.tmdb.org/t/p/w500/${movie.posterPath}',
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: styleText,
                        ),
                        Text(
                          'popularity: ${movie.popularity.toString()}',
                          style: styleText,
                        ),
                        Text(
                          'Release date: ${movie.releaseDate}',
                          style: styleText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -15,
          left: size.width / 3.5,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0F0E19),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 35,
            width: 35,
          ),
        ),
        Positioned(
          bottom: -15,
          left: size.width / 3.5,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0F0E19),
              borderRadius: BorderRadius.circular(50),
            ),
            height: 35,
            width: 35,
          ),
        ),
        Positioned(
          bottom: 180 / 2,
          right: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFF6B500),
                  Color(0xFFC79307),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text('IMDB ${movie.voteAverage.toString()}'),
          ),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:cubit_example/features/movies/domain/entities/movie_entity.dart';
import 'package:cubit_example/features/movies/domain/repositories/get_movies_rated_repository_interface.dart';
import 'package:dio/dio.dart';

class GetMoviesRatedHttpRepository implements IGetMoviesRatedRepository {
  final Dio _dio;

  GetMoviesRatedHttpRepository(this._dio);
  @override
  Future<List<MovieEntity>> get() async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=1abb3e68d878be1155d781ce812f80a8',
      );

      if (response.statusCode == HttpStatus.ok) {
        Iterable json = response.data['results'];
        List<MovieEntity> movies = json.map((movie) {
          return MovieEntity.fromJson(movie);
        }).toList();

        return movies;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}

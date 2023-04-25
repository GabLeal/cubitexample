import 'package:cubit_example/features/favorities/presentation/ui/pages/favorities_page.dart';
import 'package:cubit_example/features/favorities/injection/favorites_injection.dart';
import 'package:cubit_example/features/movies/injection/movies_injection.dart';
import 'package:cubit_example/features/movies/presentation/ui/pages/movies_page.dart';
import 'package:cubit_example/shared/constants/scafold_key.dart';
import 'package:flutter/material.dart';

void main() {
  FavoritesInjection.initializeDependencies();
  MoviesInjection.initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routes: {
        '/': (context) => const MoviesPage(),
        '/favorities': (context) => const FavoritiesPage()
      },
      initialRoute: '/',
    );
  }
}

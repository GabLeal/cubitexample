import 'package:flutter/material.dart';

class MovieXLoading extends StatelessWidget {
  const MovieXLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Color(0xFFF6B500),
    );
  }
}

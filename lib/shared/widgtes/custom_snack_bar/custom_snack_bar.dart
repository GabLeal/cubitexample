import 'package:cubit_example/shared/constants/scafold_key.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Center(child: Text(message)),
      backgroundColor: Colors.green[800],
      behavior: SnackBarBehavior.floating,
    );

    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static void showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Center(child: Text(message)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

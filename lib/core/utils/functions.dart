import 'package:flutter/material.dart';
import 'package:my_news/core/global_keys.dart';

void showSnackBar(String message) {
  final snackBar = SnackBar(content: Text(message));
  scaffoldMessengerKey.currentState!
    ..clearSnackBars()
    ..showSnackBar(snackBar);
}

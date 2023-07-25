import 'package:flutter/material.dart';

class Logger {
  static void print(value) {
    debugPrint(value, wrapWidth: 2048);
  }
}

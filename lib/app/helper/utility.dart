import 'package:flutter/material.dart';

class Utility {
  static final Utility _utility = Utility._internal();

  factory Utility() {
    return _utility;
  }

  Utility._internal();

  void singletonPrint() {
    debugPrint('singleton print');
  }
}

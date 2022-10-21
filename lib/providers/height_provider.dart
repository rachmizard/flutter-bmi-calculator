import 'package:flutter/material.dart';

class HeightProvider with ChangeNotifier {
  double _height = 40;

  double get height => _height;

  set height(double value) {
    _height = value;
    notifyListeners();
  }
}

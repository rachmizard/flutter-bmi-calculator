import 'package:flutter/material.dart';

class GenderProvider extends ChangeNotifier {
  bool _isMale = true;

  bool get isMale => _isMale;

  set isMale(bool newValue) {
    _isMale = newValue;
    notifyListeners();
  }

  Color get color => _isMale ? Colors.blue : Colors.pink;

  Color get maleColor => _isMale ? Colors.blue : Colors.grey;
  Color get femaleColor => _isMale ? Colors.grey : Colors.pink;
}

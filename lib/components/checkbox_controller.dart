import 'package:flutter/material.dart';

class CheckboxController extends ChangeNotifier {
  bool isChecked = false;
  select() {
    isChecked = !isChecked;
    notifyListeners();
  }
}

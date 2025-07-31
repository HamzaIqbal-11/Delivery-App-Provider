import 'package:flutter/material.dart';

class Categorycontroller extends ChangeNotifier {
  bool showSearchField = false;

  void iconTap() {
    showSearchField = !showSearchField;
    notifyListeners();
  }
}

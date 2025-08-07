import 'package:flutter/material.dart';

class Productcontroller extends ChangeNotifier {
  int currentIndex = 0;
  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

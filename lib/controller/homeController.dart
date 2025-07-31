import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectIndex = 0;

  void itemTapped(int index) {
    selectIndex = index;
    notifyListeners();
  }
}

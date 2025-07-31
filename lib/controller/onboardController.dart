import 'package:flutter/material.dart';

class Onboardcontroller extends ChangeNotifier {
  int currentPage = 0;
  void Function(int)? onPageChanged(int pages) {
    currentPage = pages;
    notifyListeners();
  }
}

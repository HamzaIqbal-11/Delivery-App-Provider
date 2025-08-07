import 'package:flutter/material.dart';

class Productlistcontroller extends ChangeNotifier {
  int currentImage = 0;
  void Function(int)? onImageChange(int image) {
    currentImage = image;
    notifyListeners();
  }
}

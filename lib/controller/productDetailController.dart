import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  int currentImage = 0;
  int i = 0;
  double? rating;
  bool showNutriText = false;
  bool showRevText = false;
  void Function(int)? onImageChange(int image) {
    currentImage = image;
    notifyListeners();
  }

  void starRating(double updateRating) {
    rating = updateRating;
    notifyListeners();
  }

  void nutriTextHide() {
    showNutriText = !showNutriText;
    notifyListeners();
  }

  void revTextHide() {
    showRevText = !showRevText;
    notifyListeners();
  }
}

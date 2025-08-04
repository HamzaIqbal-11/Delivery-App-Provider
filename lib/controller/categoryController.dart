import 'package:delivery_app/model/categoryModel.dart';
import 'package:flutter/material.dart';

class Categorycontroller extends ChangeNotifier {
  bool showSearchField = false;
  List<CategoryModel> currentList = [];

  void iconTap() {
    showSearchField = !showSearchField;
    notifyListeners();
  }

  void currentListTap(List<CategoryModel> list) {
    currentList = list;
    notifyListeners();
  }
}

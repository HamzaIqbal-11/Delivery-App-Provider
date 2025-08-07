import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/model/categoryModel.dart';
import 'package:flutter/material.dart';

class Categorycontroller extends ChangeNotifier {
  bool showSearchField = false;
  List<CategoryModel> currentList = [];

  List<CategoryModel> subCategoryList = [
    CategoryModel(
        productName: 'Big & Small Fishes',
        productCategory: 'Fresh from sea',
        price: 36,
        image: AppAssets.dummyImage,
        color: Color(0xffFFDC83)),
    CategoryModel(
        productName: 'Halal Meats',
        productCategory: 'Organics & Fresh',
        price: 90,
        image: AppAssets.dummyImage,
        color: Color(0xffF0FBC5)),
  ];
  List<CategoryModel> Vegetables = [
    CategoryModel(
        productName: 'Vegetables',
        productCategory: 'Fresh from Market',
        price: 20,
        image: AppAssets.dummyImage,
        color: Color(0xffFFDC83)),
  ];
  List<CategoryModel> Fruits = [
    CategoryModel(
        productName: 'Fruits',
        productCategory: 'Fresh',
        price: 30,
        image: AppAssets.dummyImage,
        color: Color(0xffFFDC83)),
  ];
  List<CategoryModel> Dairy = [
    CategoryModel(
        productName: 'Dairy',
        productCategory: 'Fresh',
        price: 36,
        image: AppAssets.dummyImage,
        color: Color(0xffFFDC83)),
  ];
  List<CategoryModel> HouseHold = [
    CategoryModel(
        productName: 'Household & Cleaning Supplies',
        productCategory: 'Safe & Effective',
        price: 25,
        image: AppAssets.dummyImage,
        color: Color(0xffFFDC83)),
  ];

  void iconTap() {
    showSearchField = !showSearchField;
    notifyListeners();
  }

  void currentListTap(List<CategoryModel> list) {
    currentList = list;
    notifyListeners();
  }
}

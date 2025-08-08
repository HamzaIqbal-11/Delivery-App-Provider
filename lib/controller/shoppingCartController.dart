import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/model/cartModel.dart';
import 'package:flutter/cupertino.dart';

class Shoppingcartcontroller extends ChangeNotifier {
  int cartLen = 0;
  int itemCount = 0;
  double subTotal = 0;
  double delivery = 0;
  double total = 0;
  bool moreItemClick = false;
  List<CartModel> cartList = [
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'Bananas',
        itemPrice: 7.90,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'Clown Tang',
        itemPrice: 4.32,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'Chicken',
        itemPrice: 10.67,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'Beef',
        itemPrice: 14.67,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'apple',
        itemPrice: 4.67,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'capsicum',
        itemPrice: 10.43,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'ladyFinger',
        itemPrice: 8.10,
        itemCount: 0),
    CartModel(
        image: AppAssets.dummyImage,
        itemName: 'Tamator',
        itemPrice: 7.89,
        itemCount: 0),
  ];

  void addItems() {
    for (var element in cartList) {
      subTotal += element.itemPrice;
    }
    delivery = 2.00;
    total = subTotal + delivery;
    notifyListeners();
  }

  void itemCountAdd(int index) {
    cartList[index].itemCount++;
    notifyListeners();
  }

  void itemCountSub(int index) {
    cartList[index].itemCount--;
    notifyListeners();
  }

  void itemClick() {
    moreItemClick = true;
    notifyListeners();
  }

  void itemSetToFalse() {
    moreItemClick = false;
    notifyListeners();
  }
}

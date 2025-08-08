import 'package:delivery_app/model/checkoutModel.dart';
import 'package:flutter/material.dart';

class Checkoutcontroller extends ChangeNotifier {
  bool selectedAddress = false;
  List<Checkoutmodel> addressList = [
    Checkoutmodel(
        addressName: 'Home',
        userAddress: '36 green way, Sunamganj',
        currentAddress: true),
    Checkoutmodel(
        addressName: 'Office',
        userAddress: '36 green way, Sunamganj',
        currentAddress: false),
    Checkoutmodel(
        addressName: 'Second Home',
        userAddress: '36 green way, Sunamganj',
        currentAddress: false),
    Checkoutmodel(
        addressName: 'Susral',
        userAddress: '36 green way, Sunamganj',
        currentAddress: false),
  ];

  void changeAddress(int index) {
    for (var element in addressList) {
      element.currentAddress = false;
    }
    addressList[index].currentAddress = true;
    notifyListeners();
  }
}

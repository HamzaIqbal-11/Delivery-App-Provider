import 'dart:ui';

class CategoryModel {
  final String productName;
  final String productCategory;
  final int price;
  final String image;
  final Color color;

  CategoryModel(
      {required this.productName,
      required this.productCategory,
      required this.price,
      required this.image,
      required this.color});
}

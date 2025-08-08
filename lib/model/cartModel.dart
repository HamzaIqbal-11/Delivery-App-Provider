class CartModel {
  final String image;
  final String itemName;
  final double itemPrice;
  int itemCount;

  CartModel(
      {required this.image,
      required this.itemName,
      required this.itemPrice,
      required this.itemCount});
}

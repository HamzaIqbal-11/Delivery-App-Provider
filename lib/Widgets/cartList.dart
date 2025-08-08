import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/controller/shoppingCartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cartList({Shoppingcartcontroller? cartProvider}) {
  return ListView.builder(
      physics: cartProvider!.moreItemClick == true
          ? ScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: cartProvider.cartList.length,
      itemBuilder: (context, index) {
        final cartItems = cartProvider.cartList[index];
        print(cartProvider.cartList.length);

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    cartItems.image,
                    color: Colors.black,
                    height: 30.h,
                    //width: 30.w,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItems.itemName,
                        style: AppStyles.customCartListTitle,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '\$${cartItems.itemPrice}',
                        style: AppStyles.customCartListTitle,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      cartProvider.itemCountSub(index);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF8F9FB), shape: BoxShape.circle),
                      child: Icon(
                        Icons.remove,
                        size: 15.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    cartItems.itemCount.toString(),
                    style: AppStyles.customCartListTitle,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.itemCountAdd(index);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF8F9FB), shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        size: 15.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
              color: Color(0xffEBEBFB),
            ),
          ],
        );
      });
}

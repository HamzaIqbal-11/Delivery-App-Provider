import 'package:delivery_app/Constants/appArguments.dart';
import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/cartList.dart';
import 'package:delivery_app/controller/shoppingCartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Shoppingcartcontroller>(context);
    print("length ${cartProvider.cartList.length}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: cartProvider.moreItemClick == true
          ? AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              leading: backbutton(() {
                Navigator.pop(context);
                cartProvider.itemSetToFalse();
              }),
              title: Text(
                'Shopping Cart (${cartProvider.cartList.length})',
                style: AppStyles.customShopingCartText,
              ),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cartProvider.moreItemClick == true
              ? SizedBox(
                  height: 15.h,
                )
              : Container(
                  height: 290.h,
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 244, 188, 77),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.bgElements),
                            )),
                      ),
                      Positioned(
                        top: 17.h,
                        left: 17.w,
                        child: SizedBox(
                          height: 100.h,
                          child: backbutton(
                            () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                          top: 54.h,
                          left: 85.w,
                          child: Text(
                            'Shopping Cart (${cartProvider.cartList.length})',
                            style: AppStyles.customShopingCartText,
                          )),
                      Positioned(
                          top: 110.h,
                          right: 20.w,
                          child: Text(
                            '25%',
                            style: AppStyles.customCartOFFPercent,
                          )),
                      Positioned(
                          top: 120.h,
                          right: 20.w,
                          child: Text(
                            'OFF!!',
                            style: AppStyles.customCartOFFText,
                          )),
                      Positioned(
                          bottom: 0.h,
                          child: Container(
                            height: 50.h,
                            //padding: EdgeInsets.only(left: 50.w, right: 30.w),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Color(0xffF9B023)),
                            child: Center(
                                child: RichText(
                                    text: TextSpan(children: [
                              TextSpan(
                                  text: 'Use code ',
                                  style: AppStyles.customCodeText),
                              TextSpan(
                                  text: '#HalalFood ',
                                  style: AppStyles.customHalalFoodText),
                              TextSpan(
                                  text: 'at checkout',
                                  style: AppStyles.customCodeText),
                            ]))),
                          )),
                    ],
                  ),
                ),
          Expanded(child: cartList(cartProvider: cartProvider)),
          cartProvider.cartList.length > 3 &&
                  cartProvider.moreItemClick == false
              ? Padding(
                  padding: EdgeInsetsGeometry.only(
                      left: 15.w, right: 15.w, top: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      cartProvider.itemClick();
                    },
                    child: Text(
                      "+ ${3} More",
                      style: AppStyles.customCartMoreItemsText,
                    ),
                  ),
                )
              : SizedBox(
                  height: 10.h,
                ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 235.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
                color: Color(0xffF8F9FB),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.h),
                    topRight: Radius.circular(30.h))),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "SubTotal",
                            style: AppStyles.customSubTotalText,
                          ),
                          Spacer(),
                          Text(
                            cartProvider.subTotal.toString(),
                            style: AppStyles.customSubTotalPrice,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery",
                            style: AppStyles.customSubTotalText,
                          ),
                          Spacer(),
                          Text(
                            cartProvider.delivery.toString(),
                            style: AppStyles.customSubTotalPrice,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: AppStyles.customSubTotalText,
                          ),
                          Spacer(),
                          Text(
                            cartProvider.total.toString(),
                            style: AppStyles.customTotalPrice,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                customAppButton('Proceed To Checkout', Colors.white,
                    Color(0xff2A4BA0), Color(0xff2A4BA0), () {
                  Navigator.pushNamed(context, AppRoutes.checkOut);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

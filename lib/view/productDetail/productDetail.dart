import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/productDescription.dart';
import 'package:delivery_app/Widgets/productPageVIew.dart';
import 'package:delivery_app/controller/productDetailController.dart';
import 'package:delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, this.productName, this.price});
  final productName;
  final price;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final productDetailProvider =
      Provider.of<ProductDetailController>(customContext!);
  final PageController pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 0.w, right: 0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 310.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 30.h,
                    left: 0.w,
                    child: SizedBox(
                      child: backbutton(() {
                        Navigator.pop(context);
                      }),
                    ),
                  ),

                  // Main content centered

                  customPageView(
                      pageViewController: pageViewController,
                      productDetailProvider: productDetailProvider),

                  // Notification button positioned properly
                  Positioned(
                    top: 30.h,
                    right: 0.w,
                    child: notificationButton(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: SizedBox(
                child: Text(
                  widget.productName,
                  style: AppStyles.custsomProductDetailName,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.h),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\$${widget.price}/",
                      style: AppStyles.customPriceText,
                    ),
                    TextSpan(
                      text: 'KG',
                      style: AppStyles.customKGText,
                    ),
                  ])),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff2A4BA0)),
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 4.h, bottom: 4.h),
                    child: Center(
                      child: Text(
                        "\$22.04 OFF",
                        style: AppStyles.customPriceOFFText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 15.h),
              child: Row(
                children: [
                  SizedBox(
                    child: RatingBar.builder(
                        initialRating: productDetailProvider.rating ?? 4.5,
                        minRating: 1,
                        itemSize: 16.93,
                        glow: false,
                        glowColor: Colors.amber.withOpacity(0.5),
                        unratedColor: Color(0xff1E222B),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: false,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        itemBuilder: (context, _) {
                          return Image.asset(AppAssets.starFill);
                        },
                        onRatingUpdate: (rating) {
                          productDetailProvider.starRating(rating);
                        }),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "110 Reviews",
                    style: AppStyles.customReviewText,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 30.h, right: 15.w),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: customAppButton('Add to Cart', Color(0XFF2A4BA0),
                        Colors.white, Color(0XFF2A4BA0), () {
                      Navigator.pushNamed(context, AppRoutes.shoppingCart);
                    }),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: customAppButton('Buy Now', Colors.white,
                        Color(0XFF2A4BA0), Color(0XFF2A4BA0), () {}),
                  ),
                ],
              ),
            ),
            productDescription(productDetailProvider: productDetailProvider),
          ],
        ),
      ),
    );
  }
}

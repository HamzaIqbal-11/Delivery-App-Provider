import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customDiscountContainer(
    {Color? bgColor, String? imgPath, String? discNum, String? ordNum}) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(15.h)),
      height: 100.h,
      width: 250.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(imgPath!),
            width: 80.w,
            height: 100.h,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Get\n", style: AppStyles.customDiscountTextLight),
                  TextSpan(
                      text: "$discNum% OFF\n",
                      style: AppStyles.customDiscountTextExtraBold),
                  TextSpan(
                      text: "on first ",
                      style: AppStyles.customDiscountTextLight),
                  TextSpan(
                      text: "$ordNum ",
                      style: AppStyles.customDiscountTextExtraBold13px),
                  TextSpan(
                      text: "order", style: AppStyles.customDiscountTextLight),
                ]))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget customRecommendCard() {
  List<ProductModel> productLists = [
    ProductModel(
        productName: 'Fresh Lemon',
        productCategory: 'Organic',
        price: 12,
        image: AppAssets.dummyImage),
    ProductModel(
        productName: 'Green Tea',
        productCategory: 'Organic',
        price: 06,
        image: AppAssets.dummyImage),
    ProductModel(
        productName: 'Apples',
        productCategory: 'Organic',
        price: 08,
        image: AppAssets.dummyImage),
    ProductModel(
        productName: 'Peaches',
        productCategory: 'Organic',
        price: 10,
        image: AppAssets.dummyImage),
    ProductModel(
        productName: 'Cucumbers',
        productCategory: 'Organic',
        price: 13,
        image: AppAssets.dummyImage),
  ];
  return SizedBox(
    height: 200,
    width: double.infinity,
    child: ListView.builder(
        itemCount: productLists.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final products = productLists[index];
          return Container(
            margin: EdgeInsets.only(left: 15.w),
            height: 194.h,
            width: 128.w,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 241),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Image(
                    color: Color(0xffA1ABC0),
                    image: AssetImage(products.image),
                    width: 56.67.w,
                    height: 56.67.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: Color(0xffE0E2EE),
                  thickness: 0.5,
                  endIndent: 15,
                  indent: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      products.productName,
                      style: AppStyles.customCardOrganicFoodName,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      products.productCategory,
                      style: AppStyles.customCardOrganicName,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 30.h,
                          child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.h)),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Unit ',
                                      style: AppStyles.customUnitText),
                                  TextSpan(
                                      text: '\$${products.price}',
                                      style:
                                          AppStyles.customOrganicFoodPriceText),
                                ])),
                              )),
                        ),
                        Positioned(
                            top: 4,
                            right: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Color(0xff2A4BA0),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                size: 12,
                                color: Colors.white,
                              )),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
  );
}

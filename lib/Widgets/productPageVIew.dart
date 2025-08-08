import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/controller/productDetailController.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/model/productListImageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget customPageView(
    {PageController? pageViewController, productDetailProvider}) {
  return Center(
    child: SizedBox(
      height: 310.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50.h,
            child: SizedBox(
              child: CircleAvatar(
                backgroundColor: Color(0xffF8F9FB),
                radius: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(220),
                  child: PageView(
                    clipBehavior: Clip.antiAlias,
                    controller: pageViewController,
                    onPageChanged: (index) {
                      productDetailProvider.onImageChange(index);
                    },
                    children: buildOnPages(),
                  ),
                ),
              ),
            ),
          ),
          //  SizedBox(height: 80.h),
          Positioned(
            top: 250,
            child: Row(children: buildPageIndicator(productDetailProvider)),
          ),

          // ),
        ],
      ),
    ),
  );
}

final imageModelList = [
  Productlistimagemodel(image: AppAssets.dummyImage),
  Productlistimagemodel(image: AppAssets.google),
  Productlistimagemodel(image: AppAssets.heartColor),
];

buildPageIndicator(productDetailProvider) {
  List<Widget> list = [];
  for (productDetailProvider.i = 0;
      productDetailProvider.i < imageModelList.length;
      productDetailProvider.i++) {
    list.add(
      productDetailProvider.i == productDetailProvider.currentImage
          ? indicator(true)
          : indicator(false),
    );
  }
  return list;
}

Widget indicator(bool isActive) {
  return Container(
    height: 5.h,
    width: 15.w, // Changed width for better visibility
    margin: EdgeInsets.symmetric(horizontal: 2.w), // Better margin
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: isActive ? Color(0xffF9B023) : Color(0xffE4E4E4),
    ),
  );
}

List<Widget> buildOnPages() {
  return imageModelList.map((model) => showImage(model)).toList();
}

Widget showImage(Productlistimagemodel img) {
  return Center(
    child: Image.asset(
      color: Colors.black,
      img.image,
      fit: BoxFit.contain,
      width: 150.w,
      height: 150.h,
    ),
  );
}

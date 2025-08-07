import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/controller/productListController.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/model/productListImageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, this.productName});
  final productName;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final productListProvider =
      Provider.of<Productlistcontroller>(customContext!);
  final PageController pageViewController = PageController(initialPage: 0);
  int i = 0;

  final imageModelList = [
    Productlistimagemodel(image: AppAssets.dummyImage),
    Productlistimagemodel(image: AppAssets.google),
    Productlistimagemodel(image: AppAssets.heartColor),
  ];

  buildPageIndicator() {
    List<Widget> list = [];
    for (i = 0; i < imageModelList.length; i++) {
      list.add(
        i == productListProvider.currentImage
            ? indicator(true)
            : indicator(false),
      );
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return Container(
      height: 5.h,
      width: isActive ? 25.w : 10.w, // Changed width for better visibility
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                // Back button positioned properly
                Positioned(
                  top: 40.h,
                  left: 0.w,
                  //left: 20.w,
                  child: SizedBox(
                    child: backbutton(() {
                      Navigator.pop(context);
                    }),
                  ),
                ),

                // Main content centered

                Center(
                  child: SizedBox(
                    height: 250.h,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 250.h,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffF8F9FB),
                            radius: 120,
                            child: PageView(
                              controller: pageViewController,
                              onPageChanged: (index) {
                                productListProvider.onImageChange(index);
                              },
                              children: buildOnPages(),
                            ),
                          ),
                        ),
                        //  SizedBox(height: 80.h),
                        Positioned(
                          top: 210,
                          left: 70,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Row(children: buildPageIndicator()),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: buildPageIndicator(),
                        // ),
                      ],
                    ),
                  ),
                ),

                // Notification button positioned properly
                Positioned(
                  top: 40.h,
                  right: 8.w,
                  child: notificationButton(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showImage(Productlistimagemodel img) {
    return Center(
      child: Image.asset(
        img.image,
        fit: BoxFit.contain,
        width: 150.w,
        height: 150.h,
      ),
    );
  }
}

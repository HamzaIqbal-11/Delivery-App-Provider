import 'package:delivery_app/Constants/appArguments.dart';
import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/bottomNavigationBar.dart';
import 'package:delivery_app/controller/productController.dart';
import 'package:delivery_app/model/subProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
    this.productName,
  });
  final productName;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int figmaWidth = 160;
  int figmaHeight = 194;

  List productCategories = [
    'Popular',
    'Low Prices',
    'Small Fishes',
    'Big Fishes',
  ];

  List<Subproductmodel> subProductList = [
    Subproductmodel(image: AppAssets.dummyImage, price: 65, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 89, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 70, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 94, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 45, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 90, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 72, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 51, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 49, name: 'Clown Tang'),
    Subproductmodel(image: AppAssets.dummyImage, price: 55, name: 'Clown Tang'),
  ];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Productcontroller>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double scaleWidth(double w) => w * (screenWidth / 375);
    double scaleHeight(double h) => h * (screenHeight / 812);

    double itemWidth = scaleWidth(figmaWidth.toDouble());
    double itemHeight = scaleHeight(figmaHeight.toDouble());
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: backbutton(() {
          Navigator.pop(context);
          // Navigator.pushNamed(context, AppRoutes.bottomNavigation, arguments: {
          //   AppArguments.index: 1,
          //   AppArguments.currentIndex: widget.index
          // });
        }),
        title: Text(
          widget.productName,
          style: AppStyles.customProductNameTitle,
        ),
        actions: [
          searchButton(context, color: Colors.black),
          notificationButton(color: Colors.black)
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return Padding(padding: EdgeInsets.only(left: 15.w));
              },
              itemCount: productCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    productProvider.updateIndex(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5.h,
                        bottom: 5.h,
                        left: index == 0 ? 15.w : 0.w,
                        right:
                            index == productCategories.length - 1 ? 15.w : 0.w),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    decoration: BoxDecoration(
                        color: productProvider.currentIndex == index
                            ? Color(0xffF9B023)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: productProvider.currentIndex == index
                                ? Color(0xffF9B023)
                                : Color(0xffB2BBCE))),
                    child: Center(
                        child: Text(
                      productCategories[index],
                      style: TextStyle(
                        color: productProvider.currentIndex == index
                            ? Colors.white
                            : Color(0xff616A7D),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: GridView.builder(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  itemCount: subProductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: scaleWidth(15),
                    childAspectRatio: itemWidth / itemHeight,
                    mainAxisSpacing: scaleHeight(15),
                  ),
                  itemBuilder: (context, index) {
                    final productList = subProductList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.productList,
                            arguments: {
                              AppArguments.productName: productList.name
                            });
                      },
                      child: Container(
                          height: itemWidth,
                          width: itemHeight,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 240, 241),
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 20.h,
                                child: Image.asset(
                                  productList.image,
                                  width: 68,
                                  height: 68,
                                  color: Color(0xffA1ABC0),
                                ),
                              ),
                              Positioned(
                                right: 15.w,
                                top: 100.h,
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
                                ),
                              ),
                              Positioned(
                                  left: 10.w,
                                  bottom: 40.h,
                                  child: Text(
                                    '\$${productList.price}',
                                    style: AppStyles.customSubProductPriceText,
                                  )),
                              Positioned(
                                  left: 10.w,
                                  bottom: 20.h,
                                  child: Text(
                                    productList.name,
                                    style: AppStyles.customSubProductNameText,
                                  ))
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}

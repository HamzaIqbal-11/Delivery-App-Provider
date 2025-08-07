import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/customCategoryCardList.dart';
import 'package:delivery_app/Widgets/customTextEditingController.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:delivery_app/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool? currentIndexColor;
  int currentIndex = 0;
  List categoriesList = [
    'Meats & Fishes',
    'Vegetables',
    'Fruits',
    'Dairy',
    'House Hold',
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<Categorycontroller>(context);
    return Scaffold(
        appBar: categoryProvider.showSearchField
            ? PreferredSize(
                preferredSize: Size.fromHeight(240.h),
                child:
                    SizedBox(height: 90.h, child: appBarSearchField(context)))
            : AppBar(
                backgroundColor: Color(0xff2A4BA0),
                automaticallyImplyLeading: false,
                title: Text(
                  "Hey, ",
                  style: AppStyles.customSemiBoldWhite22Px,
                ),
                actions: [
                  searchButton(context, color: Colors.white),
                  notificationButton(color: Colors.white)
                ],
              ),
        body: Column(children: [
          Container(
              height: 160.h,
              width: double.infinity,
              color: Color(0xff2A4BA0),
              padding: EdgeInsets.only(left: 15.w),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Shop\n', style: AppStyles.customShopText),
                TextSpan(
                    text: 'By Category', style: AppStyles.customByCategoryText)
              ]))),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  Padding(padding: EdgeInsets.only(left: 15.w)),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                print("index $currentIndex");

                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0
                        ? 15
                        : 0, // Only the first item has left padding
                    right: index == categoriesList.length - 1
                        ? 15
                        : 0, // Optional: right padding on last item
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        categoryProvider
                            .currentListTap(categoryProvider.subCategoryList);
                      } else if (index == 1) {
                        categoryProvider
                            .currentListTap(categoryProvider.Vegetables);
                      } else if (index == 2) {
                        categoryProvider
                            .currentListTap(categoryProvider.Fruits);
                      } else if (index == 3) {
                        categoryProvider.currentListTap(categoryProvider.Dairy);
                      } else if (index == 4) {
                        categoryProvider
                            .currentListTap(categoryProvider.HouseHold);
                      }
                      currentIndex = index;
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Color(0xffF9B023)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: currentIndex == index
                                ? Color(0xffF9B023)
                                : Color(0xffB2BBCE),
                          )),
                      child: Center(
                        child: Text(categoriesList[index],
                            style: TextStyle(
                              color: currentIndex == index
                                  ? Colors.white
                                  : Color(0xff616A7D),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          customCategoryListCard(context, currentIndex),
        ]));
  }
}

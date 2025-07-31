import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/customTextEditingController.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categoriesList = [
    'Meats & Fishes',
    'Vegetables',
    'Fruits',
    'Organic',
    'Hamza',
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
                  IconButton(
                    onPressed: categoryProvider.iconTap,
                    icon: Image.asset(
                      AppAssets.search,
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.bagIcon,
                        width: 16.w,
                        height: 18.h,
                      ))
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
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    Padding(padding: EdgeInsets.only(left: 15.w)),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xffB2BBCE),
                        )),
                    child: Center(
                      child: Text(
                        categoriesList[index],
                        style: AppStyles.customCategoryListText,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

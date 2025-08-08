import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Constants/appArguments.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:delivery_app/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget customCategoryListCard(context, index) {
  final categoryProvider = Provider.of<Categorycontroller>(context);

  return Expanded(
    child: SizedBox(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoryProvider.currentList.isEmpty
            ? categoryProvider.subCategoryList.length
            : categoryProvider.currentList.length,
        itemBuilder: (context, index) {
          final category = categoryProvider.currentList.isEmpty
              ? categoryProvider.subCategoryList[index]
              : categoryProvider.currentList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.products, arguments: {
                AppArguments.productCategory: category.productName,
                AppArguments.index: index,
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              child: SizedBox(
                height: 190.h,
                child: Row(
                  children: [
                    Container(
                      width: 137.w,
                      height: 167.h,
                      decoration: BoxDecoration(
                        color: category.color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          category.image,
                          width: 70.w,
                          height: 90.h,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.productName,
                              style: AppStyles.customFishText,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              category.productCategory,
                              style: AppStyles.customFishSubText,
                            ),
                            Spacer(), // Now works because parent Column is in Expanded
                            Text(
                              'Starting from',
                              style: AppStyles.customStartingFromText,
                            ),
                            SizedBox(height: 10.h),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '\$${category.price}',
                                  style: AppStyles.customPriceText),
                              TextSpan(
                                  text: '/KG', style: AppStyles.customKGText),
                            ]))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productDescription({productDetailProvider}) {
  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 25.w),
              child: Text(
                'Details',
                style: AppStyles.customDetailText,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.w, right: 15.w),
              child: Text(
                'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.',
                style: AppStyles.customSubDetailText,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 25.h),
              child: GestureDetector(
                onTap: () {
                  productDetailProvider.nutriTextHide();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nutritional facts',
                      style: AppStyles.customNutrFactTxt,
                    ),
                    productDetailProvider.showNutriText == true
                        ? Image.asset(
                            AppAssets.dropDownUp,
                            width: 15.22,
                            height: 8.99,
                          )
                        : Image.asset(
                            AppAssets.dropDown,
                            width: 15.22,
                            height: 8.99,
                          ),
                  ],
                ),
              ),
            ),
            productDetailProvider.showNutriText == true
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
                    child: Text(
                      'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.',
                      style: AppStyles.customSubDetailText,
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
              child: Divider(
                thickness: 0.5,
                color: Color(0xffB2BBCE),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
              child: GestureDetector(
                onTap: () {
                  productDetailProvider.revTextHide();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: AppStyles.customNutrFactTxt,
                    ),
                    productDetailProvider.showRevText == true
                        ? Image.asset(
                            AppAssets.dropDownUp,
                            width: 15.22,
                            height: 8.99,
                          )
                        : Image.asset(
                            AppAssets.dropDown,
                            width: 15.22,
                            height: 8.99,
                          ),
                  ],
                ),
              ),
            ),
            productDetailProvider.showRevText == true
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
                    child: Text(
                      'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.',
                      style: AppStyles.customSubDetailText,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ),
  );
}

import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_dimensions.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/controller/onboardController.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/view/onboarding/onBoardingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key, this.pages});
  final pages;

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage>
    with SingleTickerProviderStateMixin {
  final onBoardProvider = Provider.of<Onboardcontroller>(customContext!);
  final PageController pageViewController = PageController(initialPage: 0);
  int i = 0;

  buildPageIndicator() {
    List<Widget> list = [];
    for (i = 0; i < widget.pages.length; i++) {
      list.add(
        i == onBoardProvider.currentPage ? indicator(true) : indicator(false),
      );
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return Container(
      height: 5.h,
      width: isActive == true ? 25.w : 35.w,
      padding: EdgeInsets.only(right: 20.h, left: 20.h),
      margin: EdgeInsets.only(left: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isActive == true ? Color(0xff5973B5) : Colors.white,
      ),
    );
  }

  List<Widget> buildOnPages() {
    final children = <Widget>[];
    for (int i = 0; i < widget.pages.length; i++) {
      children.add(showPageData(widget.pages[i]));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    ///  final onBoardProvider = Provider.of<Onboardcontroller>(context);
    return Scaffold(
      backgroundColor: Color(0xff2A4BA0),
      body: PageView(
        controller: pageViewController,
        children: buildOnPages(),
        onPageChanged: onBoardProvider.onPageChanged,
      ),
    );
  }

  Widget showPageData(Onboardingmodel page) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 60.h,
                  left: 30.h,

                  child: Text(
                    page.headerText,
                    style: AppStyles.customBoldWhiteColor,
                  ),
                ),
                Positioned(
                  top: 182.h,
                  left: 120.h,
                  child: Image.asset(page.image, width: 30, height: 40),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.h, right: 80.h),
            child: Text(page.subText, style: AppStyles.customMediumWhiteColor),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(children: buildPageIndicator()),
          ),
          SizedBox(height: 30.h),
          Image.asset(page.centerImage, width: 250, height: 250),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w, bottom: 30.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300.w, 70.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20.h),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signIn);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Get Started",
                    style: AppStyles.customSemiBoldBlackColor,
                  ),
                  Image.asset(AppAssets.arrow, width: 20.w, height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

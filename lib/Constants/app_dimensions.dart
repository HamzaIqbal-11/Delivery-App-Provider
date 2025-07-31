// import 'package:get/get.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double pageView(BuildContext context) => screenHeight(context) / 2.71;
  double pageViewContainer(BuildContext context) =>
      screenHeight(context) / 3.94;
  double pageViewTextContainer(BuildContext context) =>
      screenHeight(context) / 7.22;

  static check(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((8.5.h));
    } else {
      return (screenHeight(context) / 90.196080);
    }
  }

  static checkWidth(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((9.5.w));
    } else {
      return (screenHeight(context) / 90.196080);
    }
  }

  static checkText(context) {
    if (MediaQuery.of(context).size.height < 690) {
      return ((9.sp));
    } else {
      return (screenHeight(context) / 90.196080);
    }
  }

  static double height10(BuildContext context) => check(context);
  static double font10(BuildContext context) => checkText(context);
  static double width10(BuildContext context) => checkWidth(context);
}

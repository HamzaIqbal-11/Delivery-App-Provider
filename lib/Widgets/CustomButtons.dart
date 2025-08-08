import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/controller/CustomController.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:delivery_app/controller/signInController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget backbutton(
  void Function()? onPressed,
) {
  return Container(
    //: const EdgeInsets.only(left: 10),
    child: IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        AppAssets.backArrow,
        width: 40.w,
        height: 44.h,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget searchButton(context, {Color? color}) {
  final categoryProv = Provider.of<Categorycontroller>(context);
  return Container(
    //: const EdgeInsets.only(left: 10),
    child: IconButton(
      onPressed: categoryProv.iconTap,
      icon: Image.asset(
        AppAssets.search,
        color: color,
        width: 18.w,
        height: 18.h,
      ),
    ),
  );
}

Widget notificationButton({Color? color}) {
  return Container(
      //: const EdgeInsets.only(left: 10),
      child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppAssets.bagIcon,
            color: color,
            width: 16.w,
            height: 18.h,
          )));
}

Widget customLoginButton(
  String buttonTxt,
  bool emailcheck,
  bool passCheck,
  void Function()? onPressed,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
      minimumSize: Size(double.infinity, 60.h),
      backgroundColor: Color(0XFF2A4BA0),
    ),
    onPressed: emailcheck == true
        ? passCheck == true
            ? onPressed
            : null
        : null,
    child: Text(buttonTxt, style: AppStyles.customSemiBoldWhiteColor),
  );
}

Widget customGoogleButton(String buttonTxt, context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
      minimumSize: Size(double.infinity, 60.h),
      backgroundColor: Color(0XFF2A4BA0),
    ),
    onPressed: () {
      SignInController().handleGoogleWithButton(context);
    },
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(buttonTxt, style: AppStyles.customSemiBoldWhiteColor),
          SizedBox(width: 10.h),
          Image.asset(AppAssets.google, width: 30.w, height: 30.h),
        ],
      ),
    ),
  );
}

Widget customAppButton(
  String buttonTxt,
  Color? txtColor,
  Color? color,
  Color? borderColor,
  void Function()? onPressed,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
          side: BorderSide(color: borderColor!)),

      minimumSize: Size(double.infinity, 60.h),
      backgroundColor: color,
      // Color(0XFF2A4BA0),
    ),
    onPressed: onPressed,
    child: Text(buttonTxt,
        style: TextStyle(
          color: txtColor,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        )),
  );
}

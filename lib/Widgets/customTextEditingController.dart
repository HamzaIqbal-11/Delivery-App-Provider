import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/controller/categoryController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget emailTextInput(
  controller,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    cursorColor: Color(0XFF2A4BA0),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFFCDD1D0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFF2A4BA0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFFCDD1D0)),
      ),
    ),
    onChanged: onChanged,
    validator: validator,
  );
}

Widget passwordTextInput(
  controller,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    cursorColor: Color(0XFF2A4BA0),
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFFCDD1D0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFF2A4BA0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFFCDD1D0)),
      ),
    ),
    onChanged: onChanged,
    validator: validator,
  );
}

Widget searchTextField() {
  return TextFormField(
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 300),
        prefixIcon: Padding(
          padding: EdgeInsets.all(15),
          child: Image(
            image: AssetImage(
              AppAssets.search,
            ),
            // width: .h,
            height: 10.w,
          ),
        ),
        hintText: 'Search Products or store',
        hintStyle: AppStyles.customSearhHintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff153075),
          ),
          borderRadius: BorderRadius.circular(70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff153075),
          ),
          borderRadius: BorderRadius.circular(70),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff153075),
            ),
            borderRadius: BorderRadius.circular(70))),
  );
}

Widget appBarSearchField(context) {
  final categoryProvider = Provider.of<Categorycontroller>(context);
  return Container(
    padding: EdgeInsets.only(top: 30.h),
    color: Color(0xff2A4BA0),
    child: TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 13.h),
          prefixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: Image(
              image: AssetImage(
                AppAssets.search,
              ),
              // width: .h,
              height: 10.w,
            ),
          ),
          hintText: 'Search',
          hintStyle: AppStyles.customSearhHintText,
          suffixIcon: TextButton(
              onPressed: categoryProvider.iconTap,
              child: Text(
                'Cancel',
                style: AppStyles.customCancelText,
              )),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff8891A5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff8891A5),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff8891A5),
            ),
          )),
    ),
  );
}

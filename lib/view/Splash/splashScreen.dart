import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Constants/app_texts.dart';
import 'package:delivery_app/controller/signInController.dart';
import 'package:delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final signInProvider = Provider.of<SignInController>(customContext!);
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      signInProvider.checkUserLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff153075),
        ),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.onBoard1,
                  width: 140,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppTexts.appName,
                style: AppStyles.customAppNameStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

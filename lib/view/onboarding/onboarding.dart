import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Constants/app_texts.dart';
import 'package:delivery_app/view/onboarding/onBoardingModel.dart';
import 'package:delivery_app/view/onboarding/onBoardingPage.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A4BA0),
      body: Onboardingpage(pages: pages),
    );
  }

  final List pages = [
    Onboardingmodel(
      headerText: AppTexts.onBoardScreen1Text,
      subText: AppTexts.onBoardSubText1,
      centerImage: AppAssets.onBoard1,
      image: AppAssets.smallHome,
    ),

    Onboardingmodel(
      headerText: AppTexts.onBoardScreen2Text,
      subText: AppTexts.onBoardSubText2,
      centerImage: AppAssets.onBoard2,
      image: AppAssets.smallHome,
    ),
  ];
}

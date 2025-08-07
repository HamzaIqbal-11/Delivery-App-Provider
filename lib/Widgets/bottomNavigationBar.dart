import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Widgets/customClipper.dart';
import 'package:delivery_app/controller/homeController.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/view/Category/category.dart';
import 'package:delivery_app/view/Favourite/favoruite.dart';
import 'package:delivery_app/view/Home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.index});
  final index;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final homeProvider = Provider.of<HomeController>(customContext!);
  final List screens = [
    HomeScreen(),
    Categories(),
    Favourites(),
  ];

  void initState() {
    super.initState();
    homeProvider.selectIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[homeProvider.selectIndex],
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Background with curved shape
            Positioned(
              child: SizedBox(
                height: 80.h,
                child: ClipPath(
                  clipper: homeProvider.selectIndex == 0
                      ? customIconClipper1()
                      : homeProvider.selectIndex == 1
                          ? customIconClipper2()
                          : customIconClipper3(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Navigation items
            Positioned(
              // Adjust this to position items correctly above the curve
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: homeProvider.selectIndex == 1 ||
                              homeProvider.selectIndex == 2
                          ? 13.w
                          : 70.w,
                    ),
                    homeProvider.selectIndex == 0
                        ? SizedBox()
                        : _buildNavItem('Home', AppAssets.home, 0, () {
                            homeProvider.selectIndex = 0;
                            homeProvider.itemTapped(0);
                          }),
                    SizedBox(
                      width: homeProvider.selectIndex == 2 ? 97.w : 70.w,
                    ),
                    homeProvider.selectIndex == 1
                        ? SizedBox()
                        : _buildNavItem('Categories', AppAssets.category, 1,
                            () {
                            homeProvider.selectIndex = 1;
                            homeProvider.itemTapped(1);
                          }),
                    SizedBox(
                      width: homeProvider.selectIndex == 1 ? 165.w : 70.w,
                    ),
                    homeProvider.selectIndex == 2
                        ? SizedBox()
                        : _buildNavItem('Favorites', AppAssets.heart, 2, () {
                            homeProvider.selectIndex = 2;
                            homeProvider.itemTapped(2);
                          }),
                  ],
                ),
              ),
            ),

            // Center floating button
            Positioned(
              bottom: 35.h, // Adjust position as needed
              left: homeProvider.selectIndex == 0
                  ? 24.w
                  : homeProvider.selectIndex == 1
                      ? 158.w
                      : 289.w, // Center horizontally
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: homeProvider.selectIndex == 0
                      ? Image.asset(
                          AppAssets.homeColor,
                          width: 30.w,
                        )
                      : homeProvider.selectIndex == 1
                          ? Image.asset(
                              AppAssets.categoryColor,
                              width: 30.w,
                            )
                          : Image.asset(
                              AppAssets.heartColor,
                              width: 30.w,
                              color: Color(0xffE0B420),
                            ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      String label, String iconPath, int index, void Function()? onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Image.asset(
              iconPath,
              width: 25.w,
              color: Color(0xff3E4554),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

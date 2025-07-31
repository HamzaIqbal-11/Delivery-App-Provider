import 'package:delivery_app/Constants/app_assets.dart';
import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/customContainer.dart';
import 'package:delivery_app/Widgets/customTextEditingController.dart';
import 'package:delivery_app/controller/homeController.dart';
import 'package:delivery_app/model/discountListModel.dart';
import 'package:delivery_app/view/Category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  List<Discountlistmodel> dicountList = [
    Discountlistmodel(
        bgColor: Color(0xffF9B023),
        image: AppAssets.dummyImage,
        discountTxt: '50',
        orderNum: '03'),
    Discountlistmodel(
        bgColor: Color(0xffE4DDCB),
        image: AppAssets.dummyImage,
        discountTxt: '30',
        orderNum: '02'),
  ];
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A4BA0),
        automaticallyImplyLeading: false,
        title: Text(
          "Hey,$name",
          style: AppStyles.customSemiBoldWhite22Px,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.abc,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 160.h,
            width: double.infinity,
            color: Color(0xff2A4BA0),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff153075),
                        borderRadius: BorderRadius.circular(70)),
                    child: searchTextField()),
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 50.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DELIVERY TO",
                            style: AppStyles.customDeliverdToText,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Expanded(
                            child: Text(
                              "North Nazimabad",
                              style: AppStyles.customAddressText,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 50.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "WITHIN",
                            style: AppStyles.customDeliverdToText,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Expanded(
                            child: Text(
                              "1 Hour",
                              style: AppStyles.customAddressText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 160.h,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: dicountList.length,
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                        itemBuilder: (context, index) {
                          Discountlistmodel list = dicountList[index];
                          return customDiscountContainer(
                              bgColor: list.bgColor,
                              imgPath: list.image,
                              discNum: list.discountTxt,
                              ordNum: list.orderNum);
                        }),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Categories()));
                      },
                      child: Text(
                        "Recommended",
                        style: AppStyles.customRecommendedTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  customRecommendCard(),
                  SizedBox(
                    height: 15.h,
                  ),
                  customRecommendCard(),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

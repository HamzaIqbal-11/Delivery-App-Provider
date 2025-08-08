import 'package:delivery_app/Constants/app_styles.dart';
import 'package:delivery_app/Widgets/CustomButtons.dart';
import 'package:delivery_app/Widgets/customTextEditingController.dart';
import 'package:delivery_app/Widgets/mapBox.dart';
import 'package:delivery_app/controller/checkoutController.dart';
import 'package:delivery_app/controller/shoppingCartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Shoppingcartcontroller>(context);
    final checkoutProvider = Provider.of<Checkoutcontroller>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: backbutton(() {
            Navigator.pop(context);
          }),
          title: Text(
            'Shopping Cart (${cartProvider.cartList.length})',
            style: AppStyles.customShopingCartText,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Delivery Address',
                style: AppStyles.customDeliveryAddressTxt,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  height: 4 * 120.h,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: checkoutProvider.addressList.length,
                      itemBuilder: (context, index) {
                        final userAddress = checkoutProvider.addressList[index];
                        return GestureDetector(
                          onTap: () {
                            checkoutProvider.changeAddress(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: userAddress.currentAddress == true
                                      ? 2
                                      : 0,
                                  color: userAddress.currentAddress == true
                                      ? Color(0xffF9B023)
                                      : Color(0xffD9D9D9),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      userAddress.addressName,
                                      style: AppStyles.customAddressNameText,
                                    ),
                                    Spacer(),
                                    userAddress.currentAddress == true
                                        ? Container(
                                            padding: EdgeInsets.all(4.h),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffF9B023),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: 15.w,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      userAddress.userAddress,
                                      style: AppStyles.customAddress,
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Edit',
                                        style: AppStyles.customEditText,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h),
                              topRight: Radius.circular(20.h))),
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'Add Address',
                                        style: AppStyles
                                            .customAddAddressSheetTitle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    appAdressTextField(
                                        context, 'Address Name', 1),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    appAdressTextField(context, 'Address', 2),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MapBoxScreen()));
                                        },
                                        child: Text(
                                          'Pick address from Map',
                                          style: AppStyles.customMapText,
                                        )),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                        color: Color.fromARGB(255, 232, 232, 234),
                        radius: Radius.circular(20.h),
                        dashPattern: [12, 20]),
                    child: Padding(
                      padding: EdgeInsets.all(25.h),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(4.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xffF9B023),
                                  )),
                              child: Icon(Icons.add)),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Add new Address",
                            style: AppStyles.customAddNewAddress,
                          ),
                        ],
                      )),
                    )),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: customAppButton('Make Payment', Colors.white,
              Color(0xff2A4BA0), Color(0xff2A4BA0), () {}),
        ));
  }
}

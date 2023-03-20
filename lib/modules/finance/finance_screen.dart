import 'package:dental_on_track/modules/finance/finance_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/circled_profile_pic.dart';
import '../../components/custom_button.dart';
import '../../components/home_page_button.dart';
import '../../components/logo.dart';
import '../../config/config.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class FinanceScreen extends StatelessWidget {
  FinanceController _controller=Get.put(FinanceController());
  FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx((){
          if(_controller.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }
          else{
            return Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Center(
                      child: Text(
                        "Finance",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            color: buttonColor,
                            fontFamily: "OpenSansBold"),
                      ),
                    ),
                    Config.user.role=="Secretary"?secretary(context):admin(context),


                  ],
                ),
                Positioned(
                    top: 0.0,
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-.8, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: buttonColor,
                                size: getProportionateScreenWidth(30),
                              ),
                            ),
                          ),
                          Center(
                            child: Logo(
                              width: MediaQuery.of(context).size.width * .5,
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }
        })
      ),
    );
  }

  Widget secretary(BuildContext context){
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        Center(
          child: Container(
            height: getProportionateScreenHeight(120),
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: const Offset(0, 1),
                  blurRadius: 1.0,
                  spreadRadius: 1.0),
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx((){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Safe Balance",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: textColor,
                        fontFamily: "OpenSansSemiBold",
                      ),
                    ),
                    Text(
                      "${_controller.balance.value} SYP",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: buttonColor,
                        fontFamily: "OpenSansSemiBold",
                      ),
                    ),
                  ],
                );
              })
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageButton(
                  onTap: (){
                    Get.toNamed('/all_receipts');
                  },
                  width: MediaQuery.of(context).size.width*.425,
                  height: getProportionateScreenHeight(120),
                  text: "All Receipts",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontFamily: "OpenSansBold",
                      color: buttonColor
                  ),
                  buttonColor: Colors.white,
                  iconColor: buttonColor,
                  imageUrl: "assets/images/account_settings.png",
                ),
                HomePageButton(
                  onTap: (){
                    Get.toNamed('/all_expenses');
                  },
                  width: MediaQuery.of(context).size.width*.425,
                  height: getProportionateScreenHeight(120),
                  text: "All Esxpenses",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontFamily: "OpenSansBold",
                      color: buttonColor
                  ),
                  buttonColor: Colors.white,
                  iconColor: buttonColor,
                  imageUrl: "assets/images/finance.png",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageButton(
                  onTap: (){
                    _controller.closeAccount();
                  },
                  width: MediaQuery.of(context).size.width*.425,
                  height: getProportionateScreenHeight(120),
                  text: "Close Account",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontFamily: "OpenSansBold",
                      color: buttonColor
                  ),
                  buttonColor: Colors.white,
                  iconColor: buttonColor,
                  imageUrl: "assets/images/account_settings.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget admin(BuildContext context){
    return Obx((){
      if(_controller.isLoading.value){
        return CircularProgressIndicator();
      }
      return Column(
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Income",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: textColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                  Text(
                    "${_controller.financialDashboard.allRevenue} SYP",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: buttonColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Expenses",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: textColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                  Text(
                    "${_controller.financialDashboard.allExpenses} SYP",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: buttonColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Outstanding",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: textColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                  Text(
                    "${_controller.financialDashboard.allUnpaid} SYP",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: buttonColor,
                      fontFamily: "OpenSansSemiBold",
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageButton(
                onTap: (){
                  _controller.showSafesResponse();
                },
                width: MediaQuery.of(context).size.width*.425,
                height: getProportionateScreenHeight(120),
                text: "All Safe",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(13),
                    fontFamily: "OpenSansBold",
                    color: buttonColor
                ),
                buttonColor: Colors.white,
                iconColor: buttonColor,
                imageUrl: "assets/images/finance.png",
              ),
              HomePageButton(
                onTap: (){
                  _controller.showExpensesInputs();
                },
                width: MediaQuery.of(context).size.width*.425,
                height: getProportionateScreenHeight(120),
                text: "All Expenses",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(13),
                    fontFamily: "OpenSansBold",
                    color: buttonColor
                ),
                buttonColor: Colors.white,
                iconColor: buttonColor,
                imageUrl: "assets/images/finance.png",
              ),
            ],
          ),
          SizedBox(height: 50,),
          HomePageButton(
            onTap: (){
             _controller.showReceiptResponse();
            },
            width: MediaQuery.of(context).size.width*.425,
            height: getProportionateScreenHeight(120),
            text: "All Receipts",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(13),
                fontFamily: "OpenSansBold",
                color: buttonColor
            ),
            buttonColor: Colors.white,
            iconColor: buttonColor,
            imageUrl: "assets/images/finance.png",
          ),
        ],
      );
    });
  }
}

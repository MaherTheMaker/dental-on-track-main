import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/diagnoses/diagnoses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/custom_input_field.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';

class AddDiagnoses extends StatelessWidget {
  DiagnosesController _controller=Get.put(DiagnosesController());
  AddDiagnoses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Center(
                  child: Text(
                    "Add Diagnoses",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontFamily: "OpenSansBold",
                      color: buttonColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(35),
                ),
                Center(
                  child: Column(
                    children: [
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.familyStatus=val;
                        },
                        hintText: "Family Status",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.discountType=val;
                        },
                        hintText: "Discount Type",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.habits=val;
                        },
                        hintText: "Habits",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.lastVisitToDoctor=val;
                        },
                        hintText: "Last Visit To Doctor",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.careWays=val;
                        },
                        hintText: "Care Ways",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                Center(
                  child: CustomButton(
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color:Colors.white,
                        fontFamily: "OpenSansBold",
                      ),
                      width: MediaQuery.of(context).size.width*.8,
                      height: getProportionateScreenHeight(56),
                      color: buttonColor,
                      onTap: () async{
                        if(_controller.familyStatus!=''&&_controller.lastVisitToDoctor!=''&&_controller.careWays!=''&&_controller.habits!=''&&_controller.discountType!='')
                        {
                          EasyLoading.show(status: "Loading");
                          await _controller.addDiagnoses();
                          if(_controller.addedStatus.value){
                            EasyLoading.showSuccess("Added Successfully");
                            Navigator.pop(context);
                          }else{
                            EasyLoading.showError("Error, Try again");
                          }
                        }else{
                          EasyLoading.showError("All Fields Are Required");
                        }
                      },
                      text: "Add Diagnoses"),
                ),

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
        ),
      ),
    );
  }
}

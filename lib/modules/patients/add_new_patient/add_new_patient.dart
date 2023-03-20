import 'package:dental_on_track/modules/patients/add_new_patient/add_new_patient_controller.dart';
import 'package:dental_on_track/modules/patients/patients_list_controller.dart';
import 'package:dental_on_track/modules/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_input_field.dart';
import '../../../components/logo.dart';
import '../../../config/constants.dart';
import '../../../config/size_config.dart';


class AddNewPatient extends StatelessWidget {
  AddNewPatientController _controller=Get.put(AddNewPatientController());

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
                    "Add New Patient",
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
                          _controller.fullName=val;
                        },
                        hintText: "FullName",
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
                          _controller.gender=val;
                        },
                        hintText: "Gender",
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
                          _controller.phoneNumber=val;
                        },
                        hintText: "Phone Number",
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
                          _controller.email=val;
                        },
                        hintText: "Email",
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
                          _controller.address=val;
                        },
                        hintText: "Address",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        isPassword: true,
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
                          _controller.age=val;
                        },
                        hintText: "Age",
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

                      ),SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.balance=val;
                        },
                        hintText: "Balance",
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
                        if(_controller.fullName!=''&&_controller.address!=''&&_controller.email!=''&&_controller.familyStatus!=''&&_controller.balance!=''&&_controller.gender!=''&&_controller.age!=''&&_controller.phoneNumber!='')
                        {
                          EasyLoading.show(status: "Loading");
                          await _controller.addPatient();
                          if(_controller.addedStatus.value){
                            EasyLoading.showSuccess("Added Successfully");
                            await PatientsListController.getAllPatients();
                            Get.offNamed('/patients_list');
                          }else{
                            EasyLoading.showError("Error, Try again");
                          }
                        }else{
                          EasyLoading.showError("All Fields Are Required");
                        }
                      },
                      text: "Add Patient"),
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

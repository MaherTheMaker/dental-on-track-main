import 'package:dental_on_track/components/patient_nav_button.dart';
import 'package:dental_on_track/modules/patients/patient_detalis/patient_details_controller.dart';
import 'package:dental_on_track/modules/patients/patients_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../components/circled_profile_pic.dart';
import '../../../components/custom_input_field.dart';
import '../../../components/logo.dart';
import '../../../config/constants.dart';
import '../../../config/size_config.dart';

class PatientDetails extends StatelessWidget {
  PatientDetailsController _controller=Get.put(PatientDetailsController());
  PatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async{
        Get.delete<PatientDetailsController>();
        await PatientsListController.getAllPatients();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Center(
                    child: Text(
                      "Patient Info",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          color: buttonColor,
                          fontFamily: "OpenSansBold"),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Container(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenWidth(100),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ProfilePic(
                          width: getProportionateScreenWidth(120),
                          height: getProportionateScreenWidth(120)),
                    ),
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name",
                          style: TextStyle(
                            fontFamily: "OpenSansRegular",
                            fontSize: getProportionateScreenWidth(14),
                            color: Colors.black,
                          ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(40),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.fullName!,
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone Number",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.phoneNumber!,
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gender",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.gender??"",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.address??"",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Age",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: '${_controller.patient.age}',
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.email??"",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Family Status",
                            style: TextStyle(
                              fontFamily: "OpenSansRegular",
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black,
                            ),
                          ),

                          CustomInputField(
                            width: MediaQuery.of(context).size.width * .85,
                            height: getProportionateScreenHeight(56),
                            onChanged: (val) {},
                            enabled: false,
                            hintText: _controller.patient.familyStatus??"",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(.5),
                                fontSize: getProportionateScreenWidth(14),
                                fontFamily: "OpenSansMedium"
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: _controller.patient.diagnosed!,
                        child: PatientButtonNav(
                          width: MediaQuery.of(context).size.width*.9,
                          height: getProportionateScreenHeight(75),
                          name: "Appointments",
                          onTap: (){
                            Get.toNamed('/book_appointment',arguments: _controller.patient.id);
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      PatientButtonNav(
                        width: MediaQuery.of(context).size.width*.9,
                        height: getProportionateScreenHeight(75),
                        name: "Medical History",
                        onTap: (){
                          Get.toNamed('/all_medical_history', arguments:_controller.patient.id );
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Visibility(
                        visible: _controller.patient.diagnosed!,
                        child: PatientButtonNav(
                          width: MediaQuery.of(context).size.width*.9,
                          height: getProportionateScreenHeight(75),
                          name: "Treatment Plan",
                          onTap: (){
                            if(_controller.patient.diagnosed!){
                              Get.toNamed('/treatment_plans_for_patinet',arguments:_controller.patient.id);
                            }else{
                              EasyLoading.showError("Please Add Diagnosis First");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Visibility(
                        visible:_controller.patient.diagnosed!,
                        child: PatientButtonNav(
                          width: MediaQuery.of(context).size.width*.9,
                          height: getProportionateScreenHeight(75),
                          name: "Dental Chart",
                          onTap: (){
                            if(_controller.patient.diagnosed!){
                              Get.toNamed('/dental_chart',arguments: _controller.patient.id);
                            }else{
                              EasyLoading.showError("Please Add Diagnosis First");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      PatientButtonNav(
                        width: MediaQuery.of(context).size.width*.9,
                        height: getProportionateScreenHeight(75),
                        name: "Diagnoses",
                        onTap: (){
                          Get.toNamed('/diagnoses',arguments: _controller.patient);
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      PatientButtonNav(
                        width: MediaQuery.of(context).size.width*.9,
                        height: getProportionateScreenHeight(75),
                        name: "Gallery",
                        onTap: (){

                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),

                    ],
                  ),


                ],
              ),
              Positioned(
                  top: 0.0,
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * .1,
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

                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

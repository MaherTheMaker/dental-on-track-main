import 'package:dental_on_track/modules/patients/treatment_plans/treatment_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../components/circled_profile_pic.dart';
import '../../../components/logo.dart';
import '../../../config/constants.dart';
import '../../../config/size_config.dart';

class TreatmentPlansForPatient extends StatelessWidget {
  var controller = Get.put(TreatmentPlanController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Center(
                    child: Text(
                      "Treatment Plans",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          color: buttonColor,
                          fontFamily: "OpenSansBold"),
                    ),
                  ),
                  controller.treatmentPlansList.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Center(
                              child: Text(
                                "No Treatment Plans",
                                style: TextStyle(
                                  color: buttonColor,
                                  fontFamily: "OpenSansBold",
                                  fontSize: getProportionateScreenWidth(20),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * .8,
                          child: ListView.separated(
                            itemCount: controller.treatmentPlansList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Container(
                                  width: SizeConfig.screenWidth * .8,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(15),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Treatment ID",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: Colors.black,
                                                fontFamily: "OpenSans"),
                                          ),
                                          Text(
                                            "${controller.treatmentPlansList[index].id}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: buttonColor,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(15),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Procedures Number",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: Colors.black,
                                                fontFamily: "OpenSans"),
                                          ),
                                          Text(
                                            "${controller.treatmentPlansList[index].toothProcedures!.length}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: buttonColor,
                                                fontFamily: "OpenSans"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(15),
                                      ),
                                      /*Row(
                                        children: [
                                          Text("Notes :",
                                            style: TextStyle(
                                                fontSize: getProportionateScreenWidth(15),
                                                color: Colors.black,
                                                fontFamily: "OpenSans"
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width:SizeConfig.screenWidth *.7,
                                            child: Text("${controller.treatmentPlansList[index].notes} " ,
                                              style: TextStyle(
                                                  fontSize: getProportionateScreenWidth(15),
                                                  color: Colors.black,
                                                  fontFamily: "OpenSans"
                                              ),
                                            ),
                                          ),
                                        ],
                                      )*/
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Procedures Details :",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: buttonColor,
                                                fontFamily: "OpenSansBold"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(15),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .treatmentPlansList[index]
                                            .toothProcedures!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int ind) {
                                          return Center(
                                            child: Container(
                                              width:
                                                  SizeConfig.screenWidth * .7,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: ExpansionTile(
                                                title: Text(
                                                  '${controller.treatmentPlansList[index].toothProcedures![ind].procedure!.pName}',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Patient Tooth",
                                                        style: TextStyle(
                                                            fontSize:
                                                                getProportionateScreenWidth(
                                                                    15),
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "OpenSans"),
                                                      ),
                                                      Text(
                                                        "${controller.treatmentPlansList[index].toothProcedures![ind].patientTooth!.id}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                getProportionateScreenWidth(
                                                                    15),
                                                            color: buttonColor,
                                                            fontFamily:
                                                                "OpenSans"),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Price",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: Colors.black,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                      Text(
                                                        "${controller.treatmentPlansList[index].toothProcedures![ind].price}",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: buttonColor,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Done ",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: Colors.black,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                      Text(
                                                        "${controller.treatmentPlansList[index].toothProcedures![ind].done}",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: buttonColor,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Paid ",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: Colors.black,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                      Text(
                                                        "${controller.treatmentPlansList[index].toothProcedures![ind].paid}",
                                                        style: TextStyle(
                                                            fontSize:
                                                            getProportionateScreenWidth(
                                                                15),
                                                            color: buttonColor,
                                                            fontFamily:
                                                            "OpenSans"),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int ind) {
                                          return SizedBox(
                                            height: 10,
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          ),
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
                            onTap: () {},
                            child: Container(
                              width: getProportionateScreenWidth(50),
                              height: getProportionateScreenWidth(50),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3.0,
                                        offset: Offset(0, 1),
                                        spreadRadius: 1.0),
                                  ]),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.list,
                                    color: buttonColor),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(.8, 0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenWidth(50),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          offset: Offset(0, 3),
                                          spreadRadius: 3.0),
                                    ]),
                                child: ProfilePic(
                                    color: Colors.transparent,
                                    width: getProportionateScreenWidth(50),
                                    height: getProportionateScreenWidth(50))),
                          ),
                        ),
                        Center(
                          child: Logo(
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .1,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed('/add_new_patient');
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:dental_on_track/components/patient_card.dart';
import 'package:dental_on_track/modules/illnesses/illnesses_controller.dart';
import 'package:dental_on_track/modules/patients/patients_list_controller.dart';
import 'package:dental_on_track/modules/prodecures/procedure_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/circled_profile_pic.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class IllnessesList extends StatelessWidget {
  IllnessesController _controller=Get.put(IllnessesController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx((){
            if(_controller.isLoading.value){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                      Center(
                        child: Text("Illnesses",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(22),
                              color: buttonColor,
                              fontFamily: "OpenSansBold"
                          ),
                        ),
                      ),
                      _controller.isEmpty.value?Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Center(child: Text("No Illnesses",
                            style: TextStyle(
                              color: buttonColor,
                              fontFamily: "OpenSansBold",
                              fontSize: getProportionateScreenWidth(20),
                            ),
                          ),),
                        ],
                      ):SizedBox(
                        height: MediaQuery.of(context).size.height*.7,
                        child: ListView.builder(
                            itemCount: _controller.illnessList.length,
                            itemBuilder: (BuildContext context,int index){
                              return Column(
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Center(
                                    child: Container(
                                      width:MediaQuery.of(context).size.width*.9,
                                      height:MediaQuery.of(context).size.height*.2,
                                      decoration:BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0,1),
                                                color: Colors.grey.withOpacity(.5),
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.circular(10.0))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Center(
                                              child: SizedBox(
                                                width:MediaQuery.of(context).size.width*.9,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Name:",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:Colors.black,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                    Text(
                                                      "${_controller.illnessList[index].name}",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:buttonColor,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width:MediaQuery.of(context).size.width*.9,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Gender:",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:Colors.black,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                    Text(
                                                      "${_controller.illnessList[index].gender}",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:buttonColor,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width:MediaQuery.of(context).size.width*.9,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Notes:",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:Colors.black,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                    Text(
                                                      "${_controller.illnessList[index].notes}",
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(18),
                                                        color:buttonColor,
                                                        fontFamily: "OpenSansBold",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),



                                          ],
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(35),
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
                                },
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
                                            offset: Offset(0,1),
                                            spreadRadius: 1.0
                                        ),
                                      ]
                                  ),
                                  child: const Center(
                                    child: FaIcon(FontAwesomeIcons.list,color:buttonColor),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(.8, 0),
                              child: GestureDetector(
                                onTap: () {
                                },
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
                                              offset: Offset(0,3),
                                              spreadRadius: 3.0
                                          ),
                                        ]
                                    ),
                                    child: ProfilePic(
                                        color: Colors.transparent,
                                        width: getProportionateScreenWidth(50), height: getProportionateScreenWidth(50))
                                ),
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
          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.onFABTapped();
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

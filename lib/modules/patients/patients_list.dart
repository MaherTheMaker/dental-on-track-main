import 'package:dental_on_track/components/patient_card.dart';
import 'package:dental_on_track/modules/patients/patients_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/circled_profile_pic.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';
import 'package:url_launcher/url_launcher.dart';


class PatientsList extends StatelessWidget {
  PatientsListController _controller=Get.put(PatientsListController());

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
                      child: Text("Patients",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(22),
                            color: buttonColor,
                            fontFamily: "OpenSansBold"
                        ),
                      ),
                    ),
                    PatientsListController.listEmpty.value?Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Center(child: Text("No Patients",
                        style: TextStyle(
                          color: buttonColor,
                          fontFamily: "OpenSansBold",
                          fontSize: getProportionateScreenWidth(20),
                        ),
                        ),),
                      ],
                    ):SizedBox(
                      height: MediaQuery.of(context).size.height*.8,
                      child: ListView.builder(
                          itemCount: PatientsListController.patients.length,
                          itemBuilder: (BuildContext context,int index){
                            return Column(
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                                PatientCard(
                                  width: MediaQuery.of(context).size.width*.9,
                                  height: getProportionateScreenHeight(100),
                                  name: "${PatientsListController.patients[index].fullName??""}",
                                  phoneNumber: "${PatientsListController.patients[index].phoneNumber??""}",
                                  onTap: (){
                                    Get.toNamed("/patient_details",arguments: PatientsListController.patients[index]);
                                  },
                                  onMessageTap: (){
                                    launch('sms:${PatientsListController.patients[index].phoneNumber}?body=Hi Welcome to Proto Coders Point');

                                  },
                                  onPhoneTap: (){
                                    launch('tel:${PatientsListController.patients[index].phoneNumber}');
                                  },
                                ),

                              ],
                            );
                          }),
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
          Get.offNamed('/add_new_patient');
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

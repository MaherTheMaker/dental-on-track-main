import 'package:dental_on_track/modules/patients/medical_history/all_medical_hestory_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../components/IllnesCard.dart';
import '../../../config/constants.dart';
import '../../../config/size_config.dart';

class AllMedicalHistory extends StatelessWidget {
  var controller = Get.put(AllMedicalHestoryController());

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
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Center(
                    child: Text(
                      "Patient Medical History",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          color: buttonColor,
                          fontFamily: "OpenSansBold"),
                    ),
                  ),
                  controller.medHisList.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Center(
                              child: Text(
                                "No Medical History",
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
                          child: ListView.builder(
                              itemCount: controller.medHisList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: getProportionateScreenHeight(15),
                                    ),
                                    Center(
                                      child: IllnesCard(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        height:
                                            getProportionateScreenHeight(100),
                                        onTap: () {},
                                        name: "${controller.medHisList[index].illness!.name}",
                                        notes: controller.medHisList[index].notes ?? 'No Notes',
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                ],
              ),
            ],
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onFABTapped();
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

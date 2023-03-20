import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/custom_input_field.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';
import '../patients/medical_history/all_medical_hestory_service.dart';
import '../patients/medical_history/medical_hes_model.dart';

class IllnessesController extends GetxController{
  var isLoading = false.obs;
  var isAdding = false.obs;
  List<Illnesses> illnessList = [];
  var isEmpty=false.obs;
  final AllMedicalHestoryService _service = AllMedicalHestoryService();
  String? name,gender,notes;

  @override
  void onInit() {
    isLoading = true.obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllIllnesses();
  }

  getAllIllnesses() async {
    var response = await _service.getAllIIllnesses();
    illnessList = response;
    if(illnessList.isEmpty){
      isEmpty.value=true;
    }
    isLoading.value = false;
    update();
  }
  addNewIllness() async {
    isAdding(true);
    var response =
    await _service.addNewIllness(name!,notes!,gender!);
    if (response) {
      Get.back();
      EasyLoading.showSuccess('Added Successfully');
      isAdding(false);
      refreshData();
    }
  }
  refreshData() async {
    isLoading.value = true;
    var response = await _service.getAllIIllnesses();
    illnessList = response;
    isLoading.value = false;
  }

  onFABTapped() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add New Illness",
                    style: TextStyle(
                      color: buttonColor,
                      fontFamily: "OpenSansBold",
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    height: 50,
                    width: SizeConfig.screenWidth * .7,
                    onChanged: (String) {
                      name = String;
                    },
                    hintText: 'Name',
                    action: TextInputAction.none,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    height: 50,
                    width: SizeConfig.screenWidth * .7,
                    onChanged: (String) {
                      gender = String;
                    },
                    hintText: 'Gender',
                    action: TextInputAction.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    height: 50,
                    width: SizeConfig.screenWidth * .7,
                    onChanged: (String) {
                      notes = String;
                    },
                    hintText: 'Notes',
                    action: TextInputAction.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (isAdding.value) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                          fontFamily: "OpenSansBold",
                        ),
                        width: MediaQuery.of(context).size.width * .8,
                        height: getProportionateScreenHeight(56),
                        color: buttonColor,
                        onTap: () async {
                          addNewIllness();
                        },
                        text: "Save");
                  })
                ],
              ),
            );
          },
          onClosing: () {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                10,
              ),
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.screenHeight,
            minHeight: SizeConfig.screenHeight * .4,
          ),
          enableDrag: false,
        );
      },
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            10,
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: SizeConfig.screenHeight,
        minHeight: SizeConfig.screenHeight * .4,
      ),
    );
  }
}
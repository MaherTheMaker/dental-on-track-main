import 'package:dental_on_track/components/custom_button.dart';
import 'package:dental_on_track/components/custom_input_field.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/patients/medical_history/all_medical_hestory_service.dart';
import 'package:dental_on_track/modules/patients/medical_history/medical_hes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../config/config.dart';

class AllMedicalHestoryController extends GetxController {
  var isLoading = false.obs;
  var isAdding = false.obs;
  final AllMedicalHestoryService _service = AllMedicalHestoryService();
  List<MedicalHistory> medHisList = [];
  List<Illnesses> illnessList = [];
  late int patientId;
  late String selectedIllness ;
  String notes = '';
  List<DropdownMenuItem<String>> genderDropDownItems = [];

  @override
  void onInit() {
    patientId = Get.arguments;
    isLoading = true.obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllMedHistory();
  }

  getAllMedHistory() async {
    var response = await _service.getAllMedHis(1);
    medHisList = response;
    getAllIllnesses();
    update();
  }

  getAllIllnesses() async {
    var response = await _service.getAllIIllnesses();
    illnessList = response;
    initDropDown();

    isLoading.value = false;
    update();
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
                    "Add New Medical History",
                    style: TextStyle(
                      color: buttonColor,
                      fontFamily: "OpenSansBold",
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: SizeConfig.screenWidth * .7,
                    child: DropdownButtonFormField<String>(
                      onChanged: (v) {
                        setSelectedillness(v);
                      },
                      items: genderDropDownItems,
                      value: selectedIllness,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        labelText: 'Illness'.tr,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSansBold',
                          fontSize: 15,
                        ),
                      ),
                    ),
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
                    hintText: 'notes',
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
                          addNewMedHis();
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

  initDropDown() {
    genderDropDownItems = List.generate(
        illnessList.length,
        (index) => DropdownMenuItem(
              value: '${illnessList[index].id}',
              child: Text(illnessList[index].name ?? ''),
            ));
    selectedIllness=genderDropDownItems[0].value!;
  }

  setSelectedillness(String? illnessId) {
    if (illnessId == null) {
      return;
    }
    selectedIllness = illnessId;
    print(selectedIllness);
    update();
  }

  addNewMedHis() async {
    if(selectedIllness == 'none'){
      EasyLoading.showError('Please Select an illness');
      return;
    }
    isAdding(true);
    var response =
    await _service.addMedHis(int.parse(selectedIllness), notes, patientId);
    if (response) {
      Get.back();
      EasyLoading.showSuccess('Added Successfully');
      isAdding(false);
      refreshData();
    }
  }

  refreshData() async {
    isLoading.value = true;
    var response = await _service.getAllMedHis(1);
    medHisList = response;
    isLoading.value = false;
  }


}

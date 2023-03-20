import 'package:dental_on_track/modules/dental_chart/teeth_service.dart';
import 'package:dental_on_track/modules/dental_chart/tooth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/custom_input_field.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class TeethController extends GetxController{
  var isLoading=false.obs;

  TeethService _service=TeethService();
  List<DropdownMenuItem<String>> teethStatus = [

  ];
  String? selectedIllness="Normal";

  String? notes="";
  var list=[
    "Normal",
    "Extracted",
    "Broken",
    "Rotten"
  ];


  @override
  void onInit() {
    super.onInit();
    initDropDown();
  }

  onFABTapped(Tooth t) {
    showDialog(
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
                    "Edit Tooth Status",
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
                        selectedIllness=v;
                      },
                      items: teethStatus,
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

                  Center(
                    child: CustomButton(
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                            fontFamily: "OpenSansBold",
                          ),
                          width: MediaQuery.of(context).size.width * .8,
                          height: getProportionateScreenHeight(56),
                          color: buttonColor,
                          onTap: () async {
                            _service.editTeeth(t, selectedIllness!, notes!);
                          },
                          text: "Save"),
                  ),

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

    );
  }

  initDropDown() {
    teethStatus = List.generate(
        list.length,
            (index) => DropdownMenuItem(
          value: list[index],
          child: Text(list[index] ?? ''),
        ));
    selectedIllness=teethStatus [0].value!;
  }

}
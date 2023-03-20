import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_input_field.dart';
import '../../../../config/config.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';
import '../../finance_service.dart';
import 'all_expenses_model.dart';

class AllExpensesBySafe extends GetxController{
  var isLoading=false.obs;
  var isAdding=false.obs;
  String safeName=Config.user.username!;
  FinanceService _service=FinanceService();
  late List<Expenses> expenses;
  var isEmpty=false.obs;
  String price='';
  String details='';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllExpenses();
  }
  getAllExpenses() async {
    isLoading(true);
     var response = await _service.getSafeExpenses(safeName);
     expenses=response;
     if(expenses.isEmpty){
       isEmpty.value=true;
     }
     isLoading(false);
    update();
  }

  addNewExpense() async {

    isAdding(true);
    if(price==null||price==''){
      EasyLoading.showError("Enter Price");
    }else{
      var response =
      await _service.addExpense(double.parse(price),details);
      if (response) {
        Get.back();
        EasyLoading.showSuccess('Added Successfully');
        isAdding(false);
        refreshData();
      }
    }

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
                    "Add New Expense",
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
                      price = String;
                    },
                    hintText: 'Price',
                    action: TextInputAction.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    height: 50,
                    width: SizeConfig.screenWidth * .7,
                    onChanged: (String) {
                      details = String;
                    },
                    hintText: 'Details',
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
                          addNewExpense();
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

  refreshData() async {
    isLoading.value = true;
    var response = await _service.getSafeExpenses(safeName);
    expenses=response;
    isLoading.value = false;
  }

}
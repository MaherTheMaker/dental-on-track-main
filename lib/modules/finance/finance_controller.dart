import 'package:dental_on_track/components/custom_button.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/finance/all_expenses_response_model.dart';
import 'package:dental_on_track/modules/finance/finance_service.dart';
import 'package:dental_on_track/modules/finance/financial_dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import 'all_receipt_response_model.dart';
import 'safe_model.dart';

class FinanceController extends GetxController {
  var isLoading = false.obs;
  late Safe safe;
  FinanceService _service = FinanceService();
  late FinancialDashboard financialDashboard;
  var balance = 0.0.obs;
  var gettingData = false.obs;
  List<AllSafesResponse> safesList = [];
  List<AllReceiptsResponse> receiptsList = [];
  List<AllExpensesResponse> expensesList = [];

  // expenses vars
  DateTime? startDate;
  DateTime? endDate;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Config.user.role == "Secretary") {
      getSafe();
    } else {
      getDashboardInfo();
    }
  }

  Future<void> getSafe() async {
    isLoading(true);
    var response = await _service.getSafeName(Config.user.username!);
    safe = response;
    balance.value = safe.balance!;
    isLoading(false);
    update();
  }

  Future<void> closeAccount() async {
    isLoading(true);
    var response = await _service.closeAccount(safe.id!);
    if (response) {
      EasyLoading.showSuccess("Done");
      getSafe();
    } else {
      EasyLoading.showError("Error");
    }
    isLoading(false);
    update();
  }

  // owner apis and functions

  getDashboardInfo() async {
    isLoading(true);
    financialDashboard = await _service.getDashboard();
    isLoading(false);
  }

  getAllSafes() async {
    gettingData(true);
    safesList = await _service.getAllSafes();
    gettingData(false);
  }

  showSafesResponse() {
    getAllSafes();
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Obx(() {
                  if (gettingData.isTrue) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Safes Balance Report",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: textColor,
                          fontFamily: "OpenSansSemiBold",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Safe Name",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: safesList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${safesList[index].name}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                              Text(
                                "${safesList[index].balance}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }));
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
      ),
    );
  }

  getAllReceipts() async {
    gettingData(true);
    receiptsList = await _service.getAllReceipts();

    gettingData(false);
  }

  showReceiptResponse() {
    getAllReceipts();
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Obx(() {
                  if (gettingData.isTrue) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "All Receipt Report",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: textColor,
                          fontFamily: "OpenSansSemiBold",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Patient Name",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                          Text(
                            "Total value",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                          Text(
                            "Date",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),*/
                      ListView.builder(
                        itemCount: receiptsList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${receiptsList[index].patientName}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                              Text(
                                "${receiptsList[index].total}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                              Text(
                                "${receiptsList[index].date.year} - ${receiptsList[index].date.month}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }));
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
      ),
    );
  }

  getAllExpenses(DateTime start, DateTime end) async {
    gettingData(true);
    expensesList = await _service.getAllExpenses(start, end);
    gettingData(false);
  }

  showExpensesInputs() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Generate Expenses Report",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: textColor,
                        fontFamily: "OpenSansSemiBold",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "From Date : ",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(13),
                            color: textColor,
                            fontFamily: "OpenSansSemiBold",
                          ),
                        ),
                        GetBuilder<FinanceController>(
                          builder: (_){
                            return Text(
                              startDate != null ? '${startDate!.year}-${startDate!.month}-${startDate!.day}': '',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(13),
                                color: textColor,
                                fontFamily: "OpenSansSemiBold",
                              ),
                            );
                          },
                        ),
                        CustomButton(
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: Colors.white,
                              fontFamily: "OpenSans",
                            ),
                            width: 100,
                            height: 40,
                            color: buttonColor,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                startDate = pickedDate;
                                print(startDate);
                                update();
                              } else {}
                            },
                            text: "Pick"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To Date : ",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(13),
                            color: textColor,
                            fontFamily: "OpenSansSemiBold",
                          ),
                        ),
                        GetBuilder<FinanceController>(
                          builder: (_){
                            return Text(
                              endDate != null ? '${endDate!.year}-${endDate!.month}-${endDate!.day}': '',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(13),
                                color: textColor,
                                fontFamily: "OpenSansSemiBold",
                              ),
                            );
                          },
                        ),
                        CustomButton(
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: Colors.white,
                              fontFamily: "OpenSans",
                            ),
                            width: 100,
                            height: 40,
                            color: buttonColor,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                endDate = pickedDate;
                                print(endDate);
                                update();
                              } else {}
                            },
                            text: "Pick"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: Colors.white,
                          fontFamily: "OpenSans",
                        ),
                        width: 150,
                        height: 50,
                        color: buttonColor,
                        onTap: () async {
                         if(startDate != null && endDate != null){
                           showExpensesData();
                         }
                         else{
                           EasyLoading.showError('Start and end date required');
                         }
                        },
                        text: "Generate"),
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
      ),
    );
  }

  showExpensesData(){
    getAllExpenses(startDate!, endDate!);
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Obx(() {
                  if (gettingData.isTrue) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "All Expenses Report",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: textColor,
                          fontFamily: "OpenSansSemiBold",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Patient Name",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                          Text(
                            "Total value",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                          Text(
                            "Date",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: buttonColor,
                              fontFamily: "OpenSansSemiBold",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),*/
                      ListView.builder(
                        itemCount: expensesList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${expensesList[index].daoUserName}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                              Text(
                                "${expensesList[index].totalPrice}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                              Text(
                                "${expensesList[index].date.year} - ${expensesList[index].date.month} - ${expensesList[index].date.month}",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: textColor,
                                  fontFamily: "OpenSansSemiBold",
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }));
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
      ),
    );

  }
}

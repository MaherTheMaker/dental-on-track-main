import 'package:get/get.dart';

import '../patient_model.dart';

class PatientDetailsController extends GetxController{
  var isLoading=true.obs;
  late Patient patient;
  @override
  void onInit() {
    patient=Get.arguments;
    super.onInit();
  }

}
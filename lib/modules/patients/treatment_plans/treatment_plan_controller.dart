import 'package:dental_on_track/modules/patients/treatment_plans/treatment_plan_model.dart';
import 'package:dental_on_track/modules/patients/treatment_plans/treatment_plan_service.dart';
import 'package:get/get.dart';

class TreatmentPlanController extends GetxController{
  var isLoading = false.obs;

  final TreatmentPlanService _service = TreatmentPlanService();
  List<TreatmentPlanResponse> treatmentPlansList = [];
  late int patientId;

  @override
  void onInit() {
    patientId = Get.arguments;
    isLoading = true.obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllTreatmentPlans();
  }


  getAllTreatmentPlans() async {
    var response = await _service.getAllTreatmentPlans(patientId);
    treatmentPlansList = response;
    print('aaaaaaaaa');
    print(response);
    print(response.length);
    isLoading.value = false;
    update();
  }

}
import 'package:dental_on_track/modules/choose_plan/choose_plan_service.dart';
import 'package:dental_on_track/modules/choose_plan/plan_status.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'plan_model.dart';

class ChoosePlanController extends GetxController{
  var isLoading=true.obs;
  late List<Plan> plans;
  late PlanStatus status;
  ChoosePlanService _service=ChoosePlanService();
  var selected=0.obs;

  @override
  void onInit() async{
    isLoading(true);
    await getPlans();
    isLoading(false);
    super.onInit();
  }
  Future<void> getPlans() async{
    plans=await _service.getPlans();
  }

  Future<void> addPlan() async{
    String planName=plans[selected.value].pName!;
    status=await _service.savePlan(planName);
    if(status!=null&&status.id!=null){
      EasyLoading.showSuccess("Plan Saved Successfully");
      Get.offNamed('/wait_confirmation');
    }else{
      EasyLoading.showError("Error, Try Again");
    }

  }
}
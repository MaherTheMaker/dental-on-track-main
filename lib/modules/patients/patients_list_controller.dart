import 'package:dental_on_track/modules/patients/patients_service.dart';
import 'package:get/get.dart';

import 'patient_model.dart';

class PatientsListController extends GetxController{
  var isLoading=true.obs;
  static late List<Patient> patients;
  static var listEmpty=false.obs;
  static PatientsService _service=PatientsService();

  @override
  void onInit() async{
    isLoading(true);
    await getAllPatients();
    isLoading(false);
    super.onInit();
  }

  static Future<void> getAllPatients() async{
    patients=await _service.getPatients();
    if(patients.isEmpty){
      listEmpty.value=true;
    }else{
      listEmpty.value=false;
    }
}
}
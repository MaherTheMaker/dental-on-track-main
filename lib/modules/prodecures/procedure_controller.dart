import 'package:dental_on_track/modules/patients/patients_service.dart';
import 'package:dental_on_track/modules/prodecures/procedure_model.dart';
import 'package:get/get.dart';

import 'procedure_service.dart';


class ProcedureController extends GetxController{
  var isLoading=true.obs;
  static late List<Procedure> procedures;
  static var listEmpty=false.obs;
  static ProcedureService _service=ProcedureService();

  @override
  void onInit() async{
    isLoading(true);
    await getAllProcedures();
    isLoading(false);
    super.onInit();
  }

  static Future<void> getAllProcedures() async{
    procedures=await _service.getProcedures();
    if(procedures.isEmpty){
      listEmpty.value=true;
    }else{
      listEmpty.value=false;
    }
  }
}
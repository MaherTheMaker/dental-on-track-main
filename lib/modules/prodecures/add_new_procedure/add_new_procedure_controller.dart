import 'package:dental_on_track/modules/patients/patients_service.dart';
import 'package:dental_on_track/modules/prodecures/procedure_service.dart';
import 'package:get/get.dart';

class AddNewProcedureController extends GetxController{
  String pName='',defaultPrice='',defaultNum="",notes="";
  var addedStatus=true.obs;

  ProcedureService _service=ProcedureService();
  Future<void> addProcedure() async{
    addedStatus.value=await _service.addProcedure(pName,defaultPrice,defaultNum,notes);
  }
}
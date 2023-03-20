import 'package:dental_on_track/modules/patients/patients_service.dart';
import 'package:get/get.dart';

class AddNewPatientController extends GetxController{
  String fullName='',gender='',phoneNumber='',email='',address='',age='',familyStatus='',balance='';
  var addedStatus=true.obs;

  PatientsService _service=PatientsService();
  Future<void> addPatient() async{
    addedStatus.value=await _service.addPatient(fullName,gender,phoneNumber,email,address,age,familyStatus,balance);
  }
}
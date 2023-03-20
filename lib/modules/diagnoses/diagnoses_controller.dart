import 'package:dental_on_track/modules/diagnoses/diagnoses_service.dart';
import 'package:get/get.dart';

import '../../config/user_model.dart';
import '../patients/patient_model.dart';

class DiagnosesController extends GetxController{
  String? familyStatus;
  late Patient patient;
  String? discountType;
  String? lastVisitToDoctor;
  String? careWays;
  String? habits;
  var addedStatus=false.obs;

  DiagnosesService _service=DiagnosesService();


  @override
  void onInit() {
    patient=Get.arguments;
    super.onInit();
  }

  Future<void> addDiagnoses() async{
    Patient patient1=Patient(
      address: patient.address,
      age: patient.age,
      balance: patient.balance,
      appointmentsList: patient.appointmentsList,
      careWays: careWays,
      deciduousTeeth: false,
      discountType: discountType,
      email: patient.email,
      familyStatus: familyStatus,
      filesList: patient.filesList,
      fullName: patient.fullName,
      gallery: patient.gallery,
      gender: patient.gender,
      habits: habits,
      id:patient.id,
      lastVisitToADoctor: lastVisitToDoctor,
      medHistoryList: patient.medHistoryList,
      phoneNumber: patient.phoneNumber
    );


    addedStatus.value=await _service.addDiagnoses(patient);
  }

}
import 'package:dental_on_track/modules/book_appointment/patinet_appointment.dart';
import 'package:get/get.dart';

import 'patinet_appointment_service.dart';

class PatientAppointmentsController extends GetxController{
  var loading=true.obs;
  late List<PatientsAppointments> patientsAppointments;
  var listEmpty=false.obs;
  final PatientAppointmentService _service=PatientAppointmentService();
  var id;
  var notes;
  var booked=false.obs;
  late DateTime date;

  @override
  void onInit() async{
    loading(true);
    id=Get.arguments;
    await getAllAppointments(id);
    loading(false);
    super.onInit();
  }

  Future<void> getAllAppointments(var id)async{
    patientsAppointments=await _service.getPatientAppointments(id);
    if(patientsAppointments.isEmpty||patientsAppointments==null){
      listEmpty.value=true;
    }
  }

  Future<void> bookAppointment(var date,var startTime,var endTime)async{
    booked.value=await _service.bookAppointment(id, date, startTime, endTime, notes);
    if(booked.value){

    }
  }

}
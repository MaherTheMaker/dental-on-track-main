import 'package:dental_on_track/modules/book_appointment/patinet_appointment.dart';
import 'package:get/get.dart';

import '../book_appointment/patinet_appointment_service.dart';

class AppointmentsController extends GetxController{
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
    await getAllAppointments();
    loading(false);
    super.onInit();
  }

  Future<void> getAllAppointments()async{
    patientsAppointments=await _service.getPatientAppointments(id);
    if(patientsAppointments.isEmpty||patientsAppointments==null){
      listEmpty.value=true;
    }
  }



}
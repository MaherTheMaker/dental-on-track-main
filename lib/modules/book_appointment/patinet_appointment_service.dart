import 'dart:convert';

import 'package:dental_on_track/modules/book_appointment/patinet_appointment.dart';

import '../../config/config.dart';

class PatientAppointmentService{
  var messageForUser;

  Future<List<PatientsAppointments>> getPatientAppointments(var id) async{
    var url = Config.publicDomainAddress +Config.getPatientAppointments+ "Calendar";
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    var appointments=patientsAppointmentsFromJson(response.body);
    return appointments;

    if(response.statusCode==200){
    }else{
      return [];
    }
  }

  Future<bool> bookAppointment(var id,var date,var startTime,var endTime,var notes) async{
    var url = Config.publicDomainAddress +Config.getPatientAppointments+ '$id/AddAppointment';
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    var body=jsonEncode({
      "date": date.toString(),
      "startTime":startTime ,
      "endTime":endTime,
      "notes":notes
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers,body: body);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200||response.statusCode==202){

      return true;
    }else{
      return false;
    }

  }
}
import 'dart:convert';

import 'package:dental_on_track/modules/patients/patient_model.dart';

import '../../config/config.dart';

class DiagnosesService{

  Future<bool> addDiagnoses(Patient patient) async{
    var url = Config.publicDomainAddress +'/patient/'+ '${patient.id}/Diagnosis';
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    var body=jsonEncode({
      "fullName":patient.fullName,
      "gender":patient.gender ,
      "phoneNumber":patient.phoneNumber,
      "email":patient.email,
      "address":patient.address,
      "age":patient.age,
      "deciduousTeeth":patient.deciduousTeeth,
      "familyStatus":patient.familyStatus,
      "discountType":patient.discountType,
      "lastVisitToADoctor":patient.lastVisitToADoctor,
      "careWays":patient.careWays,
      "habits":patient.habits,

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
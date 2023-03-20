import 'dart:convert';

import '../../config/config.dart';
import 'patient_model.dart';

class PatientsService{


  Future<List<Patient>> getPatients() async{
    var url = Config.publicDomainAddress + Config.getPatients;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var patients=patientFromJson(response.body);
      return patients;
    }else{
      return [];
    }
  }

  Future<bool> addPatient(fullName,gender,phoneNumber,email,address,age,familyStatus,balance) async{
    var url = Config.newDomainAddress + Config.addPatient;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    final msg = jsonEncode({'fullName': '$fullName',
      'gender': '$gender',
      'phoneNumber':'$phoneNumber',
      "email":'$email',
      "address":'$address',
      "age":int.parse('$age'),
      "familyStatus":'$familyStatus',
      "balance":double.parse('$balance'),
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers, body:msg);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }

}
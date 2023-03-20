import 'dart:convert';

import 'package:dental_on_track/modules/prodecures/procedure_model.dart';

import '../../config/config.dart';

class ProcedureService{


  Future<List<Procedure>> getProcedures() async{
    var url = Config.publicDomainAddress + Config.getProcedures;
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
      var procedures=procedureFromJson(response.body);
      return procedures;
    }else{
      return [];
    }
  }

  Future<bool> addProcedure(pName,defaultPrice,defaultNum,notes) async{
    var url = Config.publicDomainAddress + Config.addProcedure;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    final msg = jsonEncode({'pName': '$pName',
      'defaultPrice': double.parse('$defaultPrice'),
      'defaultNumberOfAppointments':int.parse('$defaultNum'),
      "notes":'$notes',
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
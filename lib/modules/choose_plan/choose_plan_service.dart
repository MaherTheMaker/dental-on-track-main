import 'dart:convert';

import 'package:dental_on_track/modules/choose_plan/plan_status.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/clinic_model.dart';
import '../../config/config.dart';
import 'plan_model.dart';

class ChoosePlanService{

  var error;
  var statusToDo;


  Future<List<Plan>> getPlans() async {
    var url = Config.publicDomainAddress + Config.getPlans;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.tokenn}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers,);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var plan=planFromJson(response.body);
      return plan;
    }else{
      return [];
    }
  }
  Future<PlanStatus> savePlan(planName) async {
    var url = Config.publicDomainAddress + Config.addPlan;
    var clinic=await Clinic().readData();
    var username=clinic.username;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.tokenn}'
    };

    final msg = jsonEncode({
      'username': '$username',
      'planName':'$planName',
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers, body:msg);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var plan=planStatusFromJson(response.body);
      await const FlutterSecureStorage().write(key: "choosePlan", value: "true");
      return plan;
    }else{
      return PlanStatus();
    }
  }

}
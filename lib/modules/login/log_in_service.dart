import 'dart:convert';

import 'package:dental_on_track/config/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/clinic_model.dart';
import '../../config/config.dart';
import 'domain.dart';

class LoginService{

  var error;
  var statusToDo;


  Future<bool> signIn(String email,String password) async {
    var url = Config.publicDomainAddress + Config.login;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhaG05OCIsImV4cCI6MTY1NDc0NzIyOSwiaWF0IjoxNjU0NzI5MjI5fQ.OtMIGR8yFVjqmWwge75TBQJsVoxKhhLeJ3xNczozzOVfna0qAjbBzLmK2oRex7718-At0lS5FXTQ4qmxFEVKig'
    };
    final msg = jsonEncode({'username': '$email',
      'password': '$password',});

    var response = await Config.client.post(Uri.parse(url), headers: headers, body:msg);
    print(response.statusCode);
    print(response.body);
    var responseToCheck = jsonDecode(response.body);
    if(response.statusCode==200){
      var user=userFromJson(response.body);
      Config.token=user.jwtResponse!.token;
      await user.saveData();
      print(user.role);
      await const FlutterSecureStorage().write(key: "token", value: Config.token);
      return true;
    }
    return false;


  }

  Future<Domain> getDomain() async{
    var clinic=await Clinic().readData();
    var username=clinic.username;

    var url = Config.publicDomainAddress + Config.getDomain+'ammar';
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhaGFhYWFhbTk4IiwiZXhwIjoxNjU0NzM1OTg2LCJpYXQiOjE2NTQ3MTc5ODZ9.0k5Ps3oITed88tq9-jp8gGYKQ8LAFDkZpW9Qi3jMycXXMd9lqIdlhqDW3uGJVkzY0c3CCa7lKMEpeLZ6EPCq6A'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var domain=domainFromJson(response.body);
      await const FlutterSecureStorage().write(key: "new_domain", value: "http://${domain.domain}");
      return domain;
    }else{
      return Domain();
    }
  }

}
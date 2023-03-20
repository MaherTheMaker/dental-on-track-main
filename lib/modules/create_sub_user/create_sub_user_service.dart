import 'dart:convert';

import '../../config/config.dart';

class CreateSubUserService{

  Future<bool> createSubUser(username,password,role) async{
    var url = Config.publicDomainAddress + Config.createUser+'$role';
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer ${Config.token}'
    };
    final msg = jsonEncode({'username': '$username',
      'password': '$password',

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
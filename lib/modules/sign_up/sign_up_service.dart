import 'dart:convert';

import '../../config/clinic_model.dart';
import '../../config/config.dart';

class SignUpService{

  var error;
  var statusToDo;


  // Future<bool> signIn(String email,String password) async {
  //   var url = Config.publicDomainAddress + Config.login;
  //   var deviceId=FlutterSecureStorage().read(key: "device_id");
  //   print(url);
  //   Map<String,String> headers = {'accept': '*/*',
  //     'Connection': 'keep-alive',
  //     'Content-Type':'application/json;charset=UTF-8',
  //     'NST':'${Config.NST}',
  //     'DeviceId':'$deviceId',};
  //   final msg = jsonEncode({'email': '$email',
  //     'password': '$password',});
  //
  //   var response = await Config.client.post(Uri.parse(url), headers: headers, body:msg);
  //   print(response.statusCode);
  //   print(response.body);
  //   var responseToCheck = jsonDecode(response.body);
  //
  //   if(responseToCheck["StatusCode"] == 200){
  //     LocalUser user = userFromJson(response.body);
  //     user.saveData();
  //     Config.user=user;
  //     AccountController.signedIn.value=true;
  //     statusToDo = 'done';
  //     Config.isSigned = true;
  //     return true;
  //   }
  //   else if(responseToCheck["StatusCode"] == 400){
  //     statusToDo = 'wrong';
  //     error = responseToCheck['ErrorList'];
  //     return false;
  //   }
  //   else if(response.statusCode == 422){
  //     var errorResponse = jsonDecode(response.body);
  //     statusToDo = 'wrong';
  //     error = errorResponse['ErrorList'];
  //     return false;
  //   }
  //   else if(response.statusCode == 502){
  //     var errorResponse = jsonDecode(response.body);
  //     statusToDo = 'verify';
  //     error = errorResponse['ErrorList'];
  //     return false;
  //   }
  //   else {
  //     statusToDo = 'wrong';
  //     error = 'Error in server, Try again';
  //     return false;
  //   }
  // }
  Future<bool> signUp(ownerName,username,email,mobilePhone,clinicNumber,clinicName,clinicAddress) async {
    var url = Config.publicDomainAddress + Config.signUp;
    print(url);
    Map<String,String> headers = {'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type':'application/json;charset=UTF-8',
      'Authorization':'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhaGFhYWFhbTk4IiwiZXhwIjoxNjU0NzM1OTg2LCJpYXQiOjE2NTQ3MTc5ODZ9.0k5Ps3oITed88tq9-jp8gGYKQ8LAFDkZpW9Qi3jMycXXMd9lqIdlhqDW3uGJVkzY0c3CCa7lKMEpeLZ6EPCq6A'
     };
    final msg = jsonEncode({'ownerName': '$ownerName',
      'username': '$username',
      'clinicName':'$clinicName',
      "mobilePhone":'$mobilePhone',
      "clinicAddress":'$clinicAddress',
      "clinicPhone":'$clinicNumber',
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers, body:msg);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var clinic=clinicFromJson(response.body);
      clinic.saveData();
      return true;
    }else{
      return false;
    }
  }

}
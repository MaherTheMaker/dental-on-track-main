import 'package:dental_on_track/modules/login/log_in_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../config/config.dart';

class LoginController extends GetxController{
  String username='',password='';
  var signedInStatus=false.obs;
  late var domain;

  LoginService _service=LoginService();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getDomain() async{
    domain=await _service.getDomain();
    if(domain!=null){
      Config.newDomainAddress=await const FlutterSecureStorage().read(key: "new_domain");
    }
  }
  Future<void> signIn() async{
    signedInStatus.value=await _service.signIn(username, password);
    if(signedInStatus.value){
      EasyLoading.showSuccess("Signed in Successfully");
      Get.offAllNamed('/home_page');
    }else{
      EasyLoading.showError("Error,Try Again");
    }
  }
}
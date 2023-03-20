import 'package:get/get.dart';

import '../../config/clinic_model.dart';
import 'sign_up_service.dart';

class SignUpController extends GetxController{
  var signUpStatus=false.obs;
  var ownerName='',username='',clinicName='',mobilePhone='',clinicNumber='',email='',clinicAddress='';
  late Clinic clinic;
  SignUpService _service=SignUpService();
  Future<void> signUp() async{
    signUpStatus.value=await _service.signUp(ownerName,username,email,mobilePhone,clinicNumber,clinicName,clinicAddress);
    if(signUpStatus.value){
    }
  }
}
import 'package:dental_on_track/modules/create_sub_user/create_sub_user_service.dart';
import 'package:get/get.dart';

class CreateSubUserController extends GetxController{

  String username='',password='';
  int? role;
  var roles=[
    "Secretary",
    "Assistant"
  ];
  var selected=0.obs;
  var addedStatus=false.obs;

  CreateSubUserService _service=CreateSubUserService();
  Future<void> createSubUser() async{
    if(selected.value==0){
      role=1;
    }else{
      role=2;
    }
    addedStatus.value=await _service.createSubUser(username,password,role);
  }
}
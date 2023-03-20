import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../config/config.dart';
import '../../config/user_model.dart';

class PreLoaderController extends GetxController{
  static var isLoading=true.obs;
  var toPlan=false.obs;
  var signedIn=false.obs;

  User user=User();

  @override
  Future<void> onReady() async{
    isLoading(true);
    await initUser();
    isLoading(false);
    super.onReady();
  }

  Future<void> initUser() async{
   toPlan.value=await const FlutterSecureStorage().read(key: "choosePlan")=="false";
   Config.token=await const FlutterSecureStorage().read(key: "token");
   Config.user=await User().readData();
   print(Config.user.role);
   Config.newDomainAddress=await const FlutterSecureStorage().read(key: 'new_domain');
   if(Config.token!=null){
     signedIn.value=true;
   }else{
     signedIn.value=false;
   }
  }
}

import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/choose_plan/choose_plan.dart';
import 'package:dental_on_track/modules/home_page/home_page.dart';
import 'package:dental_on_track/modules/login/login.dart';
import 'package:dental_on_track/modules/pre_loader/pre_loader_controller.dart';
import 'package:dental_on_track/modules/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/logo.dart';


class PreLoader extends StatefulWidget {

  PreLoader({Key? key}) : super(key: key);

  @override
  State<PreLoader> createState() => _PreLoaderState();
}

class _PreLoaderState extends State<PreLoader>  {
  PreLoaderController controller=Get.put(PreLoaderController(),tag:"preloader");



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child:Obx((){
          if(PreLoaderController.isLoading.value){
            return Center(
              child: Logo(
                width: MediaQuery.of(context).size.width*.5,
                height: getProportionateScreenHeight(150),
              ),
            );
          }else{
            if(controller.toPlan.value){
              return ChoosePlan();
            }else if(controller.signedIn.value){
              return HomePage();
            }else if(!controller.signedIn.value){
              return Login();
            }
            return SignUp();
          }
        }),
      ),
    );
  }
}

import 'package:dental_on_track/components/custom_input_field.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/logo.dart';

class Login extends StatelessWidget {
  LoginController _controller=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontFamily: "OpenSansBold",
                      color: buttonColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(35),
                ),
                Center(
                  child: Column(
                    children: [
                      CustomInputField(
                          width: MediaQuery.of(context).size.width * .85,
                          height: getProportionateScreenHeight(56),
                          onChanged: (val) {
                            _controller.username=val;
                          },
                          hintText: "Username",
                        hintStyle: TextStyle(
                          color: buttonColor.withOpacity(.5),
                          fontSize: getProportionateScreenWidth(16),
                          fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.password=val;
                        },
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        isPassword: true,
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),

                Center(
                  child: CustomButton(
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color:Colors.white,
                        fontFamily: "OpenSansBold",
                      ),
                      width: MediaQuery.of(context).size.width*.8,
                      height: getProportionateScreenHeight(56),
                      color: buttonColor,
                      onTap: ()async{
                        if(_controller.username!=null&&_controller.password!=null){
                          EasyLoading.show(status: "Loading");
                          //await _controller.getDomain();
                          await _controller.signIn();
                        }
                      },
                      text: "Sign In"),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed('/sign_up');
                  },
                  child: Center(
                    child: Text(
                    "Create Account",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color:buttonColor,
                        fontFamily: "OpenSansBold",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 0.0,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(-.8, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: buttonColor,
                            size: getProportionateScreenWidth(30),
                          ),
                        ),
                      ),
                      Center(
                        child: Logo(
                          width: MediaQuery.of(context).size.width * .5,
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

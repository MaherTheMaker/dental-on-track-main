import 'package:dental_on_track/modules/create_sub_user/create_sub_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/custom_input_field.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';
class CreateSubUser extends StatelessWidget {
  CreateSubUserController _controller=Get.put(CreateSubUserController());
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
                      Obx((){
                        return Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height*.6,
                            width: MediaQuery.of(context).size.width*.9,
                            child: ListView.builder(
                                itemCount: _controller.roles.length,
                                itemBuilder: (BuildContext context,int index){
                                  print("asnfhibadsv");
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                            _controller.selected.value=index;
                                        },
                                        child: Container(
                                          height:MediaQuery.of(context).size.height*.1,
                                          decoration: _controller.selected.value!=index?BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0,1),
                                                    color: Colors.grey.withOpacity(.5),
                                                    spreadRadius: 1.0,
                                                    blurRadius: 1.0
                                                ),
                                              ],
                                              borderRadius: const BorderRadius.all(Radius.circular(10.0))
                                          ):const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0,1),
                                                    color: Colors.black,
                                                    spreadRadius: 1.0,
                                                    blurRadius: 1.0
                                                ),
                                              ],
                                              borderRadius: const BorderRadius.all(Radius.circular(10.0))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "${_controller.roles[index]}",
                                                  style: TextStyle(
                                                    fontSize: getProportionateScreenWidth(18),
                                                    color:buttonColor,
                                                    fontFamily: "OpenSansBold",
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(15),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        );

                      }),

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
                          await _controller.createSubUser();
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

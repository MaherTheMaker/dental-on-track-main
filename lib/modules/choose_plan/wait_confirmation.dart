import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class WaitConfirmation extends StatelessWidget {
  const WaitConfirmation({Key? key}) : super(key: key);
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Your Clinic has been created successfully, All you need to do now is to wait for a message from us containing your email and password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontFamily: "OpenSansBold",
                          color: buttonColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
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
                        onTap: () async{
                          Get.offNamed('/login');
                        },
                        text: "Confirm"),
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
          )
      ),
    );
  }
}

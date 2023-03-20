import 'package:dental_on_track/dashboard/dashboard_home.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_input_field.dart';
import '../config/constants.dart';
import '../config/size_config.dart';

class DashboardLogin extends StatelessWidget {
  const DashboardLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              gradientColor.withOpacity(.75),
              Colors.white,
            ],
          )),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height * .45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: const Offset(0, 1),
                        blurRadius: 1.0,
                        spreadRadius: 1.0),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInputField(
                      width: MediaQuery.of(context).size.width * .35,
                      height: MediaQuery.of(context).size.height * .1,
                      onChanged: (val) {},
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: buttonColor.withOpacity(.5),
                          fontSize: getProportionateScreenWidth(12),
                          fontFamily: "OpenSansMedium"),
                      textStyle: TextStyle(
                          color: buttonColor,
                          fontSize: getProportionateScreenWidth(12),
                          fontFamily: "OpenSansSemiBold"),
                      isPassword: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .075,
                    ),
                    CustomButton(
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: Colors.white,
                          fontFamily: "OpenSansBold",
                        ),
                        width: MediaQuery.of(context).size.width * .2,
                        height: getProportionateScreenHeight(100),
                        color: buttonColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardHome()));
                        },
                        text: "Log In"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

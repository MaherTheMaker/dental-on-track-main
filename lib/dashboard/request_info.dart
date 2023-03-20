import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_input_field.dart';
import '../config/constants.dart';
import '../config/size_config.dart';

class PendingRequestInfo extends StatelessWidget {
  int num=1;
  String name="maker";

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
          child: Column(
            children: [
              Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .05,
                                ),
                                Center(
                                  child: Text(
                                    "Pending Request Number $num",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: getProportionateScreenWidth(18),
                                      fontFamily: "OpenSansBold",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .1,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * .4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          color: Colors.grey
                                              .withOpacity(.5),
                                          offset: const Offset(0, 1),
                                        ),
                                      ]),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Text("nadsfubadbfkjadsngkjsdgkjsdgsgd",
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: getProportionateScreenWidth(14),
                                        fontFamily: "OpenSansBold",
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .15,
                                ),
                                Center(
                                  child: Text(
                                    "ClinicName $name",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: getProportionateScreenWidth(18),
                                      fontFamily: "OpenSansBold",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .1,
                                ),
                                CustomInputField(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height*.15,
                                  onChanged: (val) {},
                                  hintText: "Payment ID",
                                  hintStyle: TextStyle(
                                      color: buttonColor.withOpacity(.5),
                                      fontSize: getProportionateScreenWidth(12),
                                      fontFamily: "OpenSansMedium"
                                  ),
                                  textStyle: TextStyle(
                                      color: buttonColor,
                                      fontSize: getProportionateScreenWidth(12),
                                      fontFamily: "OpenSansSemiBold"
                                  ),

                                ),
                                SizedBox(
                                  height:  MediaQuery.of(context).size.height*.075,
                                ),
                                CustomButton(
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color:Colors.white,
                                      fontFamily: "OpenSansBold",
                                    ),
                                    width: MediaQuery.of(context).size.width*.25,
                                    height: getProportionateScreenHeight(100),
                                    color: buttonColor,
                                    onTap: (){

                                    },
                                    text: "Activate"),
                              ],
                            )),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

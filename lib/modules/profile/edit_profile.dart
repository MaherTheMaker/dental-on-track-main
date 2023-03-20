import 'package:dental_on_track/components/circled_profile_pic.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_input_field.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
                    "Edit Profile",
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
                  child: ProfilePic(
                      width: getProportionateScreenWidth(120),
                      height: getProportionateScreenWidth(120)),
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
                        onChanged: (val) {},
                        hintText: "Fullname",
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
                        onChanged: (val) {},
                        hintText: "Mobile Number",
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
                        onChanged: (val) {},
                        hintText: "Address",
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
                      onTap: (){

                      },
                      text: "Save"),
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

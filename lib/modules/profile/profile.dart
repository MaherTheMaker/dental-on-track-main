import 'package:dental_on_track/components/circled_profile_pic.dart';
import 'package:dental_on_track/components/custom_button.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Align(
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
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .75,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .625,
                            width: MediaQuery.of(context).size.width * .9,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Ali Saker",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(20),
                                          fontFamily: "OpenSansRegular",
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "+963936414523",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(18),
                                          fontFamily: "OpenSansRegular",
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "AlMazzeh, Damascus",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: getProportionateScreenWidth(18),
                                          fontFamily: "OpenSansRegular",
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(30),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(175),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "OpenSansRegular",
                                              fontSize: getProportionateScreenWidth(16),
                                            ),
                                            width: MediaQuery.of(context).size.width*.8,
                                            height: getProportionateScreenHeight(56),
                                            color: buttonColor,
                                            onTap: (){

                                            },
                                            text: "Edit Profile"),
                                        CustomButton(
                                            style: TextStyle(
                                              color: buttonColor,
                                              fontFamily: "OpenSansRegular",
                                              fontSize: getProportionateScreenWidth(16),
                                            ),
                                            width: MediaQuery.of(context).size.width*.8,
                                            height: getProportionateScreenHeight(56),
                                            color: secondButtonColor,
                                            onTap: (){

                                            },
                                            text: "Change Password")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0,-.75),
                          child: Container(
                            width: getProportionateScreenWidth(120),
                            height: getProportionateScreenWidth(120),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: ProfilePic(
                                  width: getProportionateScreenWidth(120),
                                  height: getProportionateScreenWidth(120)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

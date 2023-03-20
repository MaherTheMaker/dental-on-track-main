import 'package:dental_on_track/components/circled_profile_pic.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientCard extends StatelessWidget {
  double? width,height;
  String? imageUrl,name,phoneNumber;
  Function()? onTap,onPhoneTap,onMessageTap;
  PatientCard({Key? key,this.width,this.height,this.imageUrl,this.onTap,this.name,this.phoneNumber,this.onMessageTap,this.onPhoneTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: const Offset(0,1),
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ProfilePic(width: width!*.175, height: width!*.175),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style:TextStyle(
                        color: textColor,
                        fontFamily: "OpenSansSemiBold",
                        fontSize: getProportionateScreenWidth(16),
                      ),
                      textAlign: TextAlign.start,
                    ),

                    Text(
                      phoneNumber!,
                      style:TextStyle(
                        color: textColor,
                        fontFamily: "OpenSansSemiBold",
                        fontSize: getProportionateScreenWidth(16),
                      ),
                      textAlign: TextAlign.start,
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(width: getProportionateScreenWidth(10),),
            Row(
              children: [
                GestureDetector(
                  onTap: onPhoneTap,
                  child: const FaIcon(FontAwesomeIcons.phone,color:buttonColor,size:25),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                GestureDetector(
                  onTap: onMessageTap,
                  child: const Icon(Icons.message,color:buttonColor,size:30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

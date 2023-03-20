import 'package:dental_on_track/components/circled_profile_pic.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IllnesCard extends StatelessWidget {
  double? width,height;
  String? name,notes;
  Function()? onTap;
  IllnesCard({Key? key,this.width,this.height,this.onTap,this.name,this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    notes!,
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
          SizedBox(width: getProportionateScreenWidth(30),),
        ],
      ),
    );
  }
}

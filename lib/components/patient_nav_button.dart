import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:flutter/material.dart';

class PatientButtonNav extends StatelessWidget {
  final String? name;
  final Function()? onTap;
  final double? width,height;
  const PatientButtonNav({Key? key,this.onTap,this.name,this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:buttonColor.withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-.75,0),
              child: Text(name!,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(14),
                fontFamily: "OpenSansSemiBold"
              ),
              ),
            ),
            Align(
              alignment: const Alignment(.9,0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: buttonColor,
                size: getProportionateScreenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

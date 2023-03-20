import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../config/size_config.dart';
class ProfilePic extends StatelessWidget {
  final double width, height;
  final String? imageUrl;
  final Color? color;

   const ProfilePic({Key? key, required this.width, required this.height, this.imageUrl,this.color=buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: imageUrl == null
                ? Border.all(width: 3.0, color: color!)
                : Border.all(width: 1.0, color: Colors.transparent),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: imageUrl != null
                ? SizedBox(
              width: width,
              height: height,
                  child: CircleAvatar(
              backgroundColor: gradientColor.withOpacity(.5),

                  ),
                )
                : Icon(
                    Icons.person,
                    size: getProportionateScreenWidth(width * .35),
                    color: buttonColor,
                  ),
          )),
    );
  }
}

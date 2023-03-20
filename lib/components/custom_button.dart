import 'package:dental_on_track/config/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width,height;
  final Function() onTap;
  final String text;
  final Color color;
  final TextStyle style;
  const CustomButton({required this.style,required this.width,required this.height,required this.color,required this.onTap,required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child:Center(
          child: Text(text,style:style),
        ),
      ),
    );
  }
}

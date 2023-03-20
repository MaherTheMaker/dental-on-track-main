import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  String? text; //text of the button
  String? imageUrl; //icon of the button
  double? width,height; //dimensions of the button
  TextStyle? style; //text style for the button
  Color? buttonColor,iconColor;
  Function()? onTap;
  HomePageButton({Key? key,this.onTap,this.width,this.height,this.text,this.style,this.buttonColor,this.iconColor,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color:buttonColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: Offset(0,2),
                  spreadRadius: 1.0
              ),
            ]
        ),
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height!*.5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(imageUrl!,
                fit: BoxFit.fill,
                  color: iconColor!,
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height!*.5,
              child: Center(
                child: Text(text!,
                style: style,
                )
              ),
            ),


          ],
        ),
      ),
    );
  }
}

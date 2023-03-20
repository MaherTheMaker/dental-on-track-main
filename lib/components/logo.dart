import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width,height;
  const Logo({key, required this.height,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}

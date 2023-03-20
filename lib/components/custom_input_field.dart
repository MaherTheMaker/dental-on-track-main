import 'package:dental_on_track/config/constants.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final double width, height;
  final Function(String) onChanged;
  final IconData? icon;
  final bool error,isPassword;
  final String errorText, hintText;
  final TextStyle? hintStyle,textStyle;
  final TextInputType textInputType;
  final bool enabled;
  final int maxLines;
  final TextInputAction action;

  final int? maxLength;

  const CustomInputField(
      {required this.width,
      required this.height,
      required this.onChanged,
      this.icon,
      this.action = TextInputAction.done,
      this.error = false,
      this.maxLines = 1,
      this.errorText = "",
      this.hintText = "",
      this.hintStyle,
      this.textInputType = TextInputType.text,
      this.maxLength,
        this.textStyle,
        this.enabled=true,
      this.isPassword=false})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: TextField(
          keyboardType: textInputType,
          onChanged: onChanged,
          readOnly: !enabled,
          obscureText: isPassword,
          cursorColor: buttonColor,
          style: textStyle,
          maxLines: maxLines,
          textInputAction: action,
          decoration: InputDecoration(
              errorText: error ? errorText : null,
              hintText: hintText,
              hintStyle:  hintStyle,
              labelStyle: textStyle,
              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
          maxLength: maxLength,

        ),
      ),
    );
  }
}

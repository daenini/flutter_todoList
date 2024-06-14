import 'package:flutter/material.dart';
import 'package:my_app_project/util/values.dart';

class CustomTextFormField extends StatelessWidget {

  final bool hasPrefixIcon;
  final TextInputType? textInputType;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool obscured;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  CustomTextFormField({
    this.textStyle,
    this.hintTextStyle,
    this.hintText,
    this.hasPrefixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.prefixIcon,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextFormField(
            style: textStyle,
            keyboardType: textInputType, // text 이메일인지 전화번호인지
            decoration: InputDecoration(
              border: Borders.primaryInputBorder,
              enabledBorder: Borders.enabledBorder,
              focusedBorder: Borders.focusedBorder,
              prefixIcon: hasPrefixIcon ? prefixIcon : null,
              hintText: hintText,
              hintStyle: hintTextStyle,
            ),
            obscureText: obscured, // password 처리
            controller: controller,
          ),
        ),
      ],
    );
  }
}







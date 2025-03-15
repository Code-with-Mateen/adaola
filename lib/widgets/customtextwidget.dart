// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Backgroundcolor;
  final Decoration;
  final Fontweight;
  final Fontfamily;

  CustomTextWidget(
      {required this.text,
      this.Fontfamily,
      this.Fontweight,
      this.Backgroundcolor,
      this.Decoration,
      this.fontSize = 16.0,
      this.color = Colors.black}) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: Backgroundcolor,
        fontSize: fontSize,
        decoration: Decoration,
        fontWeight: Fontweight,
        fontFamily: Fontfamily,
        color: color,
      ),
    );
  }
}

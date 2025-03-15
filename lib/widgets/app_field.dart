// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText, initialValue;
  final String? labelText, initialValue2;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;
  final bool obsecureText;
  final TextInputType? textType;
  final int? maxLength, maxLines;
  const AppField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.obsecureText = false,
    this.textType,
    this.initialValue,
    this.maxLength,
    this.maxLines,
    this.labelText,
    this.initialValue2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      cursorHeight: 18,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 17,
      ),
      keyboardType: textType,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        fillColor: Colors.white,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        labelText: hintText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      autovalidateMode: AutovalidateMode.always,
      validator: validator,
      obscureText: obsecureText,
    );
  }
}

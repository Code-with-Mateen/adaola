import 'package:flutter/material.dart';

class AppDropdownFields extends StatelessWidget {
  final void Function(dynamic value) onChanged;
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic currentValue;
  final String? hintText;
  const AppDropdownFields({
    Key? key,
    required this.items,
    this.currentValue,
    required this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        fillColor: Colors.white,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}

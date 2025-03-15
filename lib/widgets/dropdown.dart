// main.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key}) : super(key: key);

  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  // define a list of options for the dropdown
  final List<String> _animals = [
    "Email",
    "Phone",
  ];

  // the selected value
  String? _selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffA4A4A4),
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            value: _selectedAnimal,
            onChanged: (value) {
              setState(() {
                _selectedAnimal = value;
              });
            },
            hint: const Center(
              child: Text(
                "Select Option.",
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff606060),
                  backgroundColor: Colors.transparent,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
            // Hide the default underline
            underline: Container(),
            // set the color of the dropdown menu
            dropdownColor: Colors.white,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xffA4A4A4),
            ),
            isExpanded: true,

            // The list of options
            items: _animals
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xff606060),
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                    ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _animals
                .map((e) => Center(
                      child: Text(
                        e,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff606060),
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

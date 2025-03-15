// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';

class countrydropdown extends StatefulWidget {
  const countrydropdown({Key? key}) : super(key: key);

  @override
  State<countrydropdown> createState() => _countrydropdownState();
}

class _countrydropdownState extends State<countrydropdown> {
  List dropDownListData = [
    {"title": "Tanzania", "value": "1"},
    {"title": "Kenya", "value": "2"},
    {"title": "China", "value": "3"},
    {"title": "Turkish", "value": "4"},
  ];
  String defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            fillColor: Colors.white,

            // errorText: "Email ",
            // fillColor: Color(0xff21242D),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),

            hintText: "Enter first name",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isDense: true,
                value: defaultValue,
                isExpanded: true,
                menuMaxHeight: 350,
                items: [
                  const DropdownMenuItem(
                      child: Text(
                        "Country Code",
                      ),
                      value: ""),
                  ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                    return DropdownMenuItem(
                        child: Text(data['title']), value: data['value']);
                  }).toList(),
                ],
                onChanged: (value) {
                  print("selected Value $value");
                  setState(() {
                    defaultValue = value!;
                  });
                }),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
      ],
    );
  }
}

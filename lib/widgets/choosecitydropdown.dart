// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';

class citynamedropdown extends StatefulWidget {
  const citynamedropdown({Key? key}) : super(key: key);

  @override
  State<citynamedropdown> createState() => _citynamedropdownState();
}

class _citynamedropdownState extends State<citynamedropdown> {
  List dropDownListData = [
    {"title": "Arusha", "value": "1"},
    {"title": "Dodoma", "value": "2"},
    {"title": "kilimanjaro", "value": "3"},
    {"title": "Tanga", "value": "4"},
    {"title": "Morogoro", "value": "5"},
    {"title": "Pwani", "value": "6"},
    {"title": "Dar Es Sallam", "value": "6"},
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
                        "City Name",
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

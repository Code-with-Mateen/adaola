// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print

import 'package:flutter/material.dart';

class range extends StatefulWidget {
  const range({Key? key}) : super(key: key);

  @override
  State<range> createState() => _rangeState();
}

class _rangeState extends State<range> {
  RangeValues values = RangeValues(1, 100);
  RangeLabels labels = RangeLabels('0', '100');
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0,
      max: 100,
      values: values,
      divisions: 10,
      activeColor: Color(0xff000000),
      inactiveColor: Color(0xffD1D1D1),
      labels: labels,
      onChanged: (value) {
        print('START: ${value.start}, END: ${value.end}');
        setState(() {
          values = value;
          labels = RangeLabels('${value.start.toInt().toString()}\$',
              '${value.end.toInt().toString()}\$');
        });
      },
    );
  }
}

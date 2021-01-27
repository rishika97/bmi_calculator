import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.iconData,this.label});
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
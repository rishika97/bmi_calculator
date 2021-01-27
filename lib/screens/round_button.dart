import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
      ),
      fillColor: kRoundButtonColor,
      elevation: 3.0,
      constraints: BoxConstraints(
          minWidth: 40.0,
          minHeight: 40.0
      ),
      onPressed: onPressed,
    );
  }
}

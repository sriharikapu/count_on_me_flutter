import 'package:count_on_me_flutter/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {this.titleOfButton, this.colorOfButton, @required this.onPressed});

  final Color colorOfButton;
  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
            color: colorOfButton,
            borderRadius: BorderRadius.circular(20.0),
            child: MaterialButton(
                onPressed: onPressed,
                minWidth: 300.0,
                height: 60.0,
                child: Text(
                  titleOfButton,
                  style: TextStyle(
                      fontSize: 20,
                      color: kRubyRed,
                      fontWeight: FontWeight.w800),
                ))));
  }
}

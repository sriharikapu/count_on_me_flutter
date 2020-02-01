import 'package:flutter/material.dart';
import 'package:count_on_me_flutter/constants.dart';


class RedRoundedButton extends StatelessWidget {

  RedRoundedButton({this.titleOfButton, @required this.onPressed});

  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding (padding: EdgeInsets.symmetric (vertical: 10.0),
        child: Material (
            color: kRubyRed,
            borderRadius: BorderRadius.circular (20.0),
            child: MaterialButton (
                onPressed: onPressed,
                minWidth: 300.0,
                height: 60.0,
                child: Text (titleOfButton, style: TextStyle(
                    fontSize: 20,
                    color: kAmarelinho,
                    fontWeight: FontWeight.w800 ),)
            )
        )
    );
  }
}

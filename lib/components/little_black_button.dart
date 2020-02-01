import 'package:flutter/material.dart';

class LittleBlackButton extends StatelessWidget {

  LittleBlackButton({this.titleOfButton, @required this.onPressed});

  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding (
        padding: EdgeInsets.symmetric (vertical: 16.0),
        child: Material (
            color: Colors.white10,
            borderRadius: BorderRadius.circular (10.0),
            child: MaterialButton (
                onPressed: onPressed,
                minWidth: 50.0,
                height: 1.0,
                child: Text (titleOfButton,style: TextStyle(fontSize: 16, color: Colors.white)
                )
            )
        ));
  }
}

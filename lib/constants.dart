import 'package:flutter/material.dart';

const kGoldenYellow = Color(0xFFFFED26);
const kRubyRed = Color(0xFFE14143);
const kDropYellow = Color(0xFFF9B02A);
const kAmarelinho = Color(0xFFF6BE08);
const klightYellow = Color(0xFFF8FAC4);
const kpastelBlue = Color(0xFFA7C6D4);

const kSendButtonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide(color: Colors.grey, width: 2.0),
  ),
);

const kTextInputDecor = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kDropYellow, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: kDropYellow, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Colors.white70,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  color: kRubyRed,
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,

);

const kApiKey = '442eeeaf284e58f39868ab0d8332e120';

const kOpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTextFieldInputDecor = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(Icons.search, color: Colors.deepOrange,),
  hintText: 'Enter a Goerli Private Key',
  hintStyle: TextStyle(
    color: Colors.orange,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),);

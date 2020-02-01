import 'package:flutter/material.dart';

const kGoldenYellow = Color(0xFFFFED26);
const kRubyRed = Color(0xFFE14143);
const kDropYellow = Color(0xFFF9B02A);
const kAmarelinho = Color(0xFFF6BE08);
const klightYellow = Color(0xFFF8FAC4);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
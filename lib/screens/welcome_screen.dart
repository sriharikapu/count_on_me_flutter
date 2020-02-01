import 'package:count_on_me_flutter/constants.dart';
import 'package:count_on_me_flutter/screens/login_screen.dart';
import 'package:count_on_me_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:count_on_me_flutter/components/rounded_button.dart';
import 'package:count_on_me_flutter/components/red_rounded_button.dart';
import 'package:count_on_me_flutter/components/little_black_button.dart';

class WelcomeScreen extends StatefulWidget {
static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: kRubyRed, end: Colors.black).animate(controller);
    controller.forward();
    controller.addListener((){
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
        body: Padding (
          padding: EdgeInsets.symmetric (horizontal: 24.0),
          child: Center(
            child: SafeArea(
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container (
                      child: Image.asset('images/logo-transparent.png'),
                      height: 200),
                  ),
                  Text ('Count on Me ', style: TextStyle (fontSize: 60.0, color: Color (0xFFFFFFFF)),),
                  Text('Platelets to Patients', style: TextStyle (fontSize: 20, color: Colors.white, letterSpacing: 2.5),),
                  RoundedButton(
                    titleOfButton: 'I\'m a Patient | Family Member',
                    colorOfButton: kAmarelinho,
                    onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},),
                  RedRoundedButton(
                    titleOfButton: 'I\'m here to Donate',
                    onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},),
                  LittleBlackButton(
                    titleOfButton: 'Sign up',
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);},),
                ]
              ),
            ),
          ),
        ),
    );
  }
}





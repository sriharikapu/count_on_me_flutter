import 'package:count_on_me_flutter/constants.dart';
import 'package:count_on_me_flutter/screens/login_screen.dart';
import 'package:count_on_me_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:count_on_me_flutter/components/rounded_button.dart';

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
        body: SafeArea(
          child: Padding (
            padding: EdgeInsets.symmetric (horizontal: 24.0),
            child: Center(
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container (
                      child: Image.asset('images/logo-transparent.png'),
                      height: 200),
                  ),
                  Text ('Count on Me ', style: TextStyle (fontSize: 60.0, color: Color (0xFFFFFFFF),fontFamily: 'FredokaOne',),),
                  Text('Platelets to Patients', style: TextStyle (fontSize: 20, color: Colors.white, fontFamily: 'Source Sans Pro', letterSpacing: 2.5),),
                  RoundedButton(
                    titleOfButton: 'I\'m a Patient | Family Member',
                    colorOfButton: kAmarelinho,
                    onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},),
                  Padding (padding: EdgeInsets.symmetric (vertical: 10.0),
                    child: Material (
                      color: kRubyRed,
                      borderRadius: BorderRadius.circular (20.0),
                      child: MaterialButton (
                        onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},
                        minWidth: 300.0,
                        height: 60.0,
                        child: Text ('I\'m here to Donate', style: TextStyle(
                            fontSize: 20,
                            color: kAmarelinho,
                            fontWeight: FontWeight.w800 ),)
                      )
                      )
                    ),
                  Padding (
                    padding: EdgeInsets.symmetric (vertical: 16.0),
                    child: Material (
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular (10.0),
                      child: MaterialButton (
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        minWidth: 50.0,
                        height: 1.0,
                        child: Text ('Sign up',style: TextStyle(fontSize: 16, color: Colors.white)
                      )
                    )
                  ))
                ]
              ),
            ),
          ),
        ),
    );
  }
}


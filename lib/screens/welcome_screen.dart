import 'package:count_on_me_flutter/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Padding (
          padding: EdgeInsets.symmetric (horizontal: 24.0),
          child: Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar (radius: 200,
                  backgroundImage: AssetImage ('images/logo-main.png'),),
                Text ('Count on Me', style: TextStyle (fontSize: 60.0, color: Color (0xFFFFFFFF),fontFamily: 'FredokaOne',),),
                Text ("Platelets to Patients", style: TextStyle (fontSize: 20, color: Colors.white, fontFamily: 'Source Sans Pro', letterSpacing: 2.5),),
                Padding (padding: EdgeInsets.symmetric (vertical: 16.0),
                  child: Material (
                    color: kDropYellow,
                    borderRadius: BorderRadius.circular (20.0),
                    child: MaterialButton (
                      onPressed: () {Navigator.pushNamed(context, '/login_patient');
                      },
                      minWidth: 300.0,
                      height: 80.0,
                      child: Text ('I\'m a Patient | Family Member', style: TextStyle(fontSize: 20, color: kRubyRed),)
                    )
                  )
                ),
                Padding (padding: EdgeInsets.symmetric (vertical: 16.0),
                  child: Material (
                    color: kRubyRed,
                    borderRadius: BorderRadius.circular (20.0),
                    child: MaterialButton (
                      onPressed: () {
                        Navigator.pushNamed(context, '/login_donor');
                      },
                      minWidth: 300.0,
                      height: 80.0,
                      child: Text ('I\'m a Donor', style: TextStyle(fontSize: 20, color: kDropYellow),)
                    )
                    )
                  ),
                Padding (
                  padding: EdgeInsets.symmetric (vertical: 16.0),
                  child: Material (
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular (10.0),
                    elevation: 5.0,
                    child: MaterialButton (
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
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
    );
  }
}
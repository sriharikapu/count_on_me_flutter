import 'package:count_on_me_flutter/screens/chat_screen.dart';
import 'package:count_on_me_flutter/screens/login_screen.dart';
import 'package:count_on_me_flutter/screens/registration_screen.dart';
import 'package:count_on_me_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


   void main() => runApp(CountOnMeFlutter());

class CountOnMeFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login_donor': (context) => LoginScreen(),
        '/login_patient': (context) =>LoginScreen(),
        '/register': (context) =>RegistrationScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}



//    home: Scaffold(
//      backgroundColor: Colors.black,
////      appBar: AppBar(
////        title: Text("Count on Me"),
////        backgroundColor: Colors.black,
////      ),black
//      body: SafeArea(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            CircleAvatar(
//              radius: 200,
//              backgroundImage: AssetImage('images/logo-main.png'),
//            ),
//            Text("Count on Me",
//              style: TextStyle(
//                fontSize: 60,
//                color: Color(0xffffffff),
//                fontFamily: 'FredokaOne',
//              ),
//            ),
//            Text("Platelets to Patients",
//              style: TextStyle(
//                fontSize: 20,
//                color: Colors.white,
//                fontFamily: 'Source Sans Pro',
//                letterSpacing: 2.5,
//              ),
//            ),
//            SizedBox(
//              height: 20,
//              width: 150,
//              child: Divider(
//                color: Colors.yellow,
//              ),
//            ),
//            FlatButton(
//              child: Card(
//                color: kRubyRed,
//                margin: EdgeInsets.symmetric(horizontal: 85, vertical: 10,),
//                child: ListTile(
//                  leading: Icon(
//                    Icons.airline_seat_flat_angled,
//                    color: kGoldenYellow,
//                  ),
//                  title: Text(
//                    "Patient",
//                    style: TextStyle(
//                      fontSize: 32,
//                      color: kGoldenYellow,
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            FlatButton(
//              child: Card(
//                color: kGoldenYellow,
//                margin: EdgeInsets.symmetric(horizontal: 85, vertical: 10,),
//                child: ListTile(
//                  leading: Icon(
//                    Icons.favorite,
//                    color: kRubyRed,
//                  ),
//                  title: Text(
//                    "Donor",
//                    style: TextStyle(
//                      fontSize: 30,
//                      color: kRubyRed,
//                    ),
//




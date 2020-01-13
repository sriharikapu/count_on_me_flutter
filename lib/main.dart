import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
//      appBar: AppBar(
//        title: Text("Count on Me"),
//        backgroundColor: Colors.black,
//      ),black
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage('images/logo-main.png'),
            ),
            Text("Count on Me",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xffffffff),
                fontFamily: 'FredokaOne',
              ),
            ),
            Text("Platelets to Patients",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.yellow,
              ),
            ),
            FlatButton(
              child: Card(
                color: Colors.redAccent,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
                child: ListTile(
                  leading: Icon(
                    Icons.airline_seat_flat_angled,
                    color: Colors.yellow[200],
                  ),
                  title: Text(
                    "Patients",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.yellow[200],
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              child: Card(
                color: Colors.yellow,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10,),
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red[900],
                  ),
                  title: Text(
                    "Donors",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
            ),
            Text("Sign up",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
              ),
            ),
          ],
        ),
      ),
      ),
    ),
);



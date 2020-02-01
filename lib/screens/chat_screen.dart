import 'package:flutter/material.dart';
import 'package:count_on_me_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  String messageText;


  @override
  void initState() {
    super.initState ();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
      }} catch (e) {print(e);}
  }

//  void getMessagesFromChat() async {
//    final messages = await _firestore.collection('messages').getDocuments();
//    for (var message in messages.documents){
//      print(message.data);
//    }
//}

  void messagesStream() async{
   await for ( var snapshot in _firestore.collection('messages').snapshots()){
     for (var message in snapshot.documents) {
       print(message.data);
     }
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                messagesStream();
//                _auth.signOut();
//                Navigator.pop(context);
//                getMessagesFromChat();
              }),
        ],
        title: Text('⚡️Chat', style: TextStyle(color: Colors.brown.shade600, fontWeight: FontWeight.w900),),
        backgroundColor: kAmarelinho,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;},
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                          _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                        });

                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
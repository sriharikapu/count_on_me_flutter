import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:count_on_me_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close,),
              onPressed: () {
//                messagesStream();
                _auth.signOut();
                Navigator.pop(context);
//                getMessagesFromChat();
              }),
        ],
        title: Text('⚡️Chat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;},
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        messageTextController.clear();
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

//The StreamBuilder widget will turn the snapshots of data into widgets
//every time new data comes through. It is able to "rebuild" the widgets
//every time the data comes from the stream; and it does that, using the
//setState(){}  >> it will be called every time there's a new value in the stream.
//StreamBuilder: it has 2 properties. The stream: is going to tell where the data is
//coming from. From which Stream??
//and in the builder:, we have to provide the logic ("the build strategy")
//of what the StreamBuilder should actually do.
//1. The StreamBuilder receives a list of snapshots;
//2. It updates the list of messages displayed on the screen
//2. The builder needs to rebuild all the children of the StreamBuilder.
//2. The Column of Text Widgets will be rebuild.
//3.An Async Snapshot represents the most recent interaction with a stream.
//We're building a StreamBuilder and we're listening on QuerySnapshots (type)


class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: kRubyRed,
            ),
          );}
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender
          );
          messageBubbles.add (messageBubble);} {
          return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: messageBubbles,));
        }
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender, style: TextStyle(
            fontSize: 12,
            color: isMe? Colors.white : Colors.white70,
          ),),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            color: isMe? kAmarelinho: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text ('$text', style: TextStyle(
                  fontSize: 20,
              color: isMe? Colors.black : Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

//  void getMessagesFromChat() async {
//    final messages = await _firestore.collection('messages').getDocuments();
//    for (var message in messages.documents){
//      print(message.data);
//    }
//}

//  void messagesStream() async{
//    //snapshot is a method inside firestore that returns a stream of QuerySnapshots
//    //we can "listen" to the latest piece of data, or all the data inside the
//    //Count on Me 'messages' collection
//   await for ( var snapshot in _firestore.collection('messages').snapshots()){
//     for (var message in snapshot.documents) {
//       print(message.data);
//     }
//   }
//  }

//TODO: Add a background image to the chat window.
//TODO: Fix Font Families
//TODO: Integrate IPFS in MessagesStream
//TODO: instead of email auth, add ETH Wallet Auth

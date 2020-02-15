import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:count_on_me_flutter/constants.dart';

class Web3Screen extends StatefulWidget {
  static const String id = 'web3_screen';
  @override
  _Web3ScreenState createState() => _Web3ScreenState();
}

class _Web3ScreenState extends State<Web3Screen> {
  String privateKey;
  EthereumAddress alice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAmarelinho,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/logo-yellow.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(
                      color: kRubyRed,
                    ),
                    decoration: kTextFieldInputDecor,
                    onChanged: (value) {
                      privateKey = value;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    //use the Navigation pop for anything you need to pass it back somewhere
//                  Navigator.pop(context, privateKey);
                    String prefix = '0x';
                    String fullKey = prefix + privateKey;
                    print('ahhh' + fullKey);
                    print(privateKey);
                    Credentials fromHex = EthPrivateKey.fromHex(fullKey);
                    print(fromHex.toString());
                    Future<EthereumAddress> addr = fromHex.extractAddress();
                    addr.then((value) => alice = value);
                    print(alice.toString());

                  },
                  child: Container(
                    color: kDropYellow,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Get Public Key',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    decoration: kTextFieldInputDecor,
                    onChanged: (value) {
                      privateKey = value;
                    }
                ),
              ),
              FlatButton(
                onPressed: () {
                  //use the Navigation pop for anything you need to pass it back somewhere
//                  Navigator.pop(context, privateKey);
                  var apiUrl = "https://goerli.infura.io/v3/1fc5af390b99412f864b52fd4ca975ea"; //Replace with your API

                  var httpClient = new Client();
                  var ethClient = new Web3Client(apiUrl, httpClient);

                  var newAddr = "0x134BF142f525F3383c4770f2e95EeF74307aBb24";
                  EthereumAddress addr = EthereumAddress.fromHex(newAddr);
                  var futureBal = ethClient.getBalance(addr);
                  futureBal.then((value) => print(value.toString()));
                  futureBal.then((value) => print(value.getInWei.toDouble() / 1000000000000000000));
                },
                child: Text(
                  'Get Goerli Endpoint',
                  style: kButtonTextStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    decoration: kTextFieldInputDecor,
                    onChanged: (value) {
                      privateKey = value;
                    }
                ),
              ),
              FlatButton(
                onPressed: () {
                  var apiUrl = "https://goerli.infura.io/v3/1fc5af390b99412f864b52fd4ca975ea"; //Replace with your API

                  var httpClient = new Client();
                  var ethClient = new Web3Client(apiUrl, httpClient);


                  var bob = "0x651ba7a656f39f241B6F8c7D075FeD796Fab637b";
                  EthereumAddress bobAddr = EthereumAddress.fromHex(bob);

                  String prefix = '0x';
                  String fullKey = prefix + privateKey;
                  Credentials fromHex = EthPrivateKey.fromHex(fullKey);
                  print(alice.toString());
                  var msgToBob = ascii.encode("Hi there");
                  var decodedMsg = ascii.decode(msgToBob);
                  print(decodedMsg);
                  var txHash = ethClient.sendTransaction(
                    fromHex,
                    Transaction(
                      from: alice,
                      to: bobAddr,
                      gasPrice: EtherAmount.inWei(BigInt.one),
                      maxGas: 100000,
                      value: EtherAmount.fromUnitAndValue(EtherUnit.gwei, "10000000"),
                      data: msgToBob,
                    ),
                    chainId: 5,
                  );
                  txHash.then((value) {
                    sleep(const Duration(seconds: 36));
                    var txReceipt = ethClient.getTransactionReceipt(value);
                    txReceipt.then((value) => print(value.status));
                  });
                },
                child: Text(
                  'Send Goerli to Bob',
                  style: kButtonTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
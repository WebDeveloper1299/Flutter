import 'dart:async';

import 'package:flutter/material.dart';


class Intro3 extends StatefulWidget {
  const Intro3({super.key});

  @override
  State<Intro3> createState() => _Intro1State();
}

  int messageIndex = 0;
  late Timer timer;
  String message1 = "Let's get Started to explore our Feature !";

class _Intro1State extends State<Intro3> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[200],
        appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(message1.toString(), style: TextStyle(fontFamily: 'SpecialElite', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset("images/Introscreen3.png", ))
        ],
      ),
      ),
    );
  }
}
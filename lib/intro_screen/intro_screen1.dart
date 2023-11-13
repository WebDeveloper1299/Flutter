import 'dart:async';

import 'package:flutter/material.dart';


class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

  int messageIndex = 0;
  late Timer timer;
  String message = "Finding an app that help you easily keep track your GPA ";

class _Intro1State extends State<Intro1> {
  
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
        backgroundColor: Colors.deepPurple[200],
        appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(message.toString(), style: TextStyle(fontFamily: 'SpecialElite', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.center,),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset("images/Introscreen1.png", ))
        ],
      ),
      ),
    );
  }
}
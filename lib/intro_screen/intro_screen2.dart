import 'dart:async';

import 'package:flutter/material.dart';


class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro1State();
}

  int messageIndex = 0;
  late Timer timer;
  String message1 = "Our apps help you to track your GPA progress\n on anywhere you go";

class _Intro1State extends State<Intro2> {
 
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
        backgroundColor: Colors.orange[200],
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
            child: Image.asset("images/Introscreen2.png", ))
        ],
      ),
      ),
    );
  }
}
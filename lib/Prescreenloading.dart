import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_project/onbording.dart';


void main(){
  runApp(const Loading());
}


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Loadingscreen(),
    );
  }
}

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}


class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000),(){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return Prescreen();
}));
    });
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset("images/preScreen.jpg"),
       const SizedBox(
          height: 40,
        ),
       const Text("Experience the convenience of our GPA Calculator anytime, anywhere", textAlign: TextAlign.center,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),)
        
      ],
    )
    );
  }
}
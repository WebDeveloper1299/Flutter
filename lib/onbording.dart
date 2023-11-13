import 'package:flutter/material.dart';
import 'package:mad_project/homepagedisplay.dart';
import 'package:mad_project/intro_screen/intro_screen1.dart';
import 'package:mad_project/intro_screen/intro_screen2.dart';
import 'package:mad_project/intro_screen/intro_screen3.dart';
import 'package:mad_project/provideData.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const Prescreen());
}

class Prescreen extends StatelessWidget {
  const Prescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: prescreen(),
    );
  }
}

List<Widget> screen = [
 const Intro1(),
 const Intro2(),
  const Intro3(),
];

class prescreen extends StatefulWidget {
  const prescreen({super.key});

  @override
  State<prescreen> createState() => _prescreenState();
}

class _prescreenState extends State<prescreen> {
  bool ishide = false; // Initialize to false so that "Previous" button is hidden on startup
  int initialPage = 0;
  bool isdone = true;

  late PageController _controller = PageController(initialPage: initialPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
                ishide = value != 0; // Hide "Previous" button on the first page
                isdone = value != screen.length; // Hide "Next" button on the last page
              });
            },
            controller: _controller,
            itemCount: screen.length,
            itemBuilder: (context, index) {
              return screen[index];
            },
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ishide
                    ? GestureDetector(
                        onTap: () {
                          _controller.animateToPage(initialPage - 1,
                              duration:const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text("Previous"))
                    :const Text(""),
                SmoothPageIndicator(
                    controller: _controller, count: screen.length),
                isdone
                    ? GestureDetector(
                        onTap: () {
                          if (initialPage == screen.length - 1) {
                            // Handle "Get Started" action here
                            print("Get Started");
                          } else {
                            _controller.nextPage(
                                duration:const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        child: initialPage == screen.length - 1
                            ? GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Homepartpartial(index: Provider.of<ProvidData>(context, listen: false).index,);
                                }));
                              },
                              child:const Text("Get Started"))
                            :const Text("Next"))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration:const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child:const Text("")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

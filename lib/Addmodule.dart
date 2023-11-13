import 'dart:convert';

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mad_project/chart.dart';
import 'package:mad_project/homepagedisplay.dart';
import 'package:mad_project/provideData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switcher_button/switcher_button.dart';

void main() {
  runApp(ChangeNotifierProvider<ProvidData>(
    create: (context) => ProvidData(),
    child: MaterialApp(home: Viewmodule()),
  ));
}

class Viewmodule extends StatefulWidget {
  Viewmodule({Key? key}) : super(key: key);

  @override
  State<Viewmodule> createState() => _ViewmoduleState();
}

class _ViewmoduleState extends State<Viewmodule> {
  GlobalKey<FormFieldState> SemensterKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> creditunits = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> grades = GlobalKey<FormFieldState>();

  final semesters = TextEditingController();
  final controllerModuleTitle = TextEditingController();
  final controllerModuleCreditUnits = TextEditingController();
  final controllerGradeAttained = TextEditingController();
  String generateRandomImageAssetPath() {
    // List of asset image file paths
    List<String> assetImagePaths = [
      'images/image2.png',
      'images/image1.png',
      'images/image3.png',
      'images/image4.png'
      // Add more asset image file paths as needed
    ];
    // Generate a random index to select an image path
    int randomIndex = Random().nextInt(assetImagePaths.length);

    // Get the random asset image path
    String randomImageAssetPath = assetImagePaths[randomIndex];

    return randomImageAssetPath;
  }

  List<String> Semenster = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4"
  ];
  List<int> Creditsunits = [1, 2, 3, 4];

  List<String> items = ["A", "B", "C", "D", "E", "F"];
  final key = GlobalKey<FormState>();
  @override
    void initState() {
      super.initState();
      semesters.text = "";
      controllerGradeAttained.text = "";
      controllerModuleCreditUnits.text = "";
      controllerModuleTitle.text = "";
    }   @override
    void dispose() {
      controllerModuleTitle.dispose();

      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    print("first ");
    print(  Provider.of<ProvidData>(context, listen: false).index);
    print("0----");
  

 

    return  Scaffold(
        //  floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

        appBar: null,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset("Icons/5566.png", width: 50, height: 50),
                    ),
                    FittedBox(
                      child: Text(
                        "GPA Calculator",
                        style: TextStyle(
                          fontFamily: "SpecialElite",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                                    Navigator.of(context).popUntil((route) => route.isFirst);

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Homepartpartial(index: Provider.of<ProvidData>(context).index-1,);
                        }));
                      },
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.close)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Positioned(
                top: 70,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Container(
                    child: Image.asset("Icons/1.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          height: 550,
                       
                          child: Form(
                              key: key,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButtonFormField(
                                        key: SemensterKey,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(), hintText: "Semester "),
                                        value: null,
                                        validator: (value) {
                                          if (value == "" || value == null) {
                                            return "Semester is required";
                                          }
                                          return null;
                                        },
                                        items: Semenster.map((String e) => DropdownMenuItem(
                                            value: e, child: Text(e.toString())))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            semesters.text = value.toString(); // Update the selected value
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      autovalidateMode: AutovalidateMode.disabled,
                                      controller: controllerModuleTitle,
                                      validator: (value) {
                                        if (value == null||value.isEmpty) {
                                          return "Please key in the module name ";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Module Title",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownButtonFormField(
                                        key: creditunits,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(), hintText: "Module Credit Units "),
                                        value: null,
                                        validator: (value) {
                                          if (value == "" || value == null) {
                                            return "Module Credit is required";
                                          }
                                          return null;
                                        },
                                        items: Creditsunits.map((int e) => DropdownMenuItem(
                                            value: e, child: Text(e.toString())))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            controllerModuleCreditUnits.text =
                                                value.toString(); // Update the selected value
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: DropdownButtonFormField(
                                          key: grades,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(), hintText: "Grade Attained "),
                                          value: null,
                                          validator: (value) {
                                            if (value == "" || value == null) {
                                              return "Grade is required";
                                            }
                                            return null;
                                          },
                                          items: items
                                              .map((String e) =>
                                              DropdownMenuItem(value: e, child: Text(e.toString())))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                controllerGradeAttained.text = value.toString();
                                              },
                                            );
                                          })),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          child: Text("Add Module"),
                                          onPressed: () async {
                                            if (key.currentState!.validate()) {
                                              final courseData = Provider.of<ProvidData>(context, listen: false).setAddCourse(
                                                Provider.of<ProvidData>(context, listen: false).index,
                                                semesters.text,
                                                controllerModuleTitle.text,
                                                int.parse(controllerModuleCreditUnits.text),
                                                controllerGradeAttained.text,
                                                generateRandomImageAssetPath().toString(),
                                                colors[Provider.of<ProvidData>(context, listen: false).index]
                                              );

                                              if (courseData != null) {
                                                Provider.of<ProvidData>(context, listen: false).course.add(courseData);
                                                Provider.of<ProvidData>(context, listen: false).setGPACalculate();
                                                grades.currentState?.reset();
                                                creditunits.currentState?.reset();
                                                SemensterKey.currentState?.reset();

                                                controllerModuleTitle.clear();

                                                // Clear the input fields
                                              }
                                              setState(() {       

                                     Provider.of<ProvidData>(context, listen: false).setGPACalculate();
                                                print(Provider.of<ProvidData>(context, listen: false).GPAsum[Provider.of<ProvidData>(context, listen: false).index]);
                                                print(Provider.of<ProvidData>(context, listen: false).GPAsum);
                                                print("index here");
                                                print(Provider.of<ProvidData>(context, listen: false).index);
                                                print("----");
 

                                                Provider.of<ProvidData>(context, listen: false).index++;



                                          
                                                
                                                grades.currentState?.reset();
                                                creditunits.currentState?.reset();
                                                SemensterKey.currentState?.reset();

                                                controllerModuleTitle.clear();
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            padding: EdgeInsets.all(20),
                                          ),
                                        )),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

final List<Color> colors = generateRandomColors(5);

List<Color> generateRandomColors(int numberOfColors) {
  Random random = Random();
  return List.generate(
    numberOfColors,
        (index) => Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    ),
  );
}

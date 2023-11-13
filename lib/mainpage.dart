import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Mainpage());
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> with TickerProviderStateMixin {
  late AnimationController _animation;

  final controllerModuleTitle = TextEditingController();
  final controllerModuleCreditUnits = TextEditingController();
  final controllerGradeAttained = TextEditingController();

  void loadData() async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    controllerModuleTitle.text = prefer.getString("moduleTitle").toString();
    controllerModuleCreditUnits.text =
        prefer.getString("CreditUnits").toString();
    controllerGradeAttained.text = prefer.getString("Grade").toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerModuleTitle.dispose();
    controllerModuleCreditUnits.dispose();
    controllerGradeAttained.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = AnimationController(vsync: this);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
    final key = GlobalKey<FormState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Center(child: Icon(Icons.grade, color: Colors.white)),
          style: IconButton.styleFrom(
            padding: EdgeInsets.all(20),
            focusColor: Colors.black,
            backgroundColor: Colors.black,
            foregroundColor: Colors.black,
            hoverColor: Colors.grey.shade300,
          ),
        ),
        appBar: AppBar(
          title: Text(
            "GPA Calculator",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Arial",
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 30, 40),
              child: Column(
                children: [
                  Image.asset(
                    "images/Figure_Calculator.jpg",
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerModuleTitle,
                          validator: (value) {
                            if (RegExp(r'^[a-zA-Z]+$')
                                .hasMatch(value.toString())) {
                              return null;
                            }
                            return "Invalid Name";
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.view_module),
                            hintText: "Enter Module Title",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: controllerModuleCreditUnits,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                                return null;
                              }
                              return "Invalid Number";
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.grade_rounded),
                              hintText: "Module Credit Units",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controllerGradeAttained,
                          validator: (value) {
                            if (RegExp(r'^[a-zA-Z]$').hasMatch(value.toString())) {
                              return null;
                            }
                            return "Invalid Number";
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.view_module),
                            hintText: "Grade Attained",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Text("Add Module"),
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                /*   final data = {
                                  "Moduletitle":controller1.text,
                                  "Creditunit":controller2.text,
                                  "GradeAttain":controller3.text,
                                };
                                CourseData(moduleTitle: controller1.text, creditUnit: controller2.text, gradeAttain: controller3.text);
                                */
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.all(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

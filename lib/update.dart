import 'dart:convert';

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mad_project/chart.dart';
import 'package:mad_project/homepagedisplay.dart';
import 'package:mad_project/information.dart';
import 'package:mad_project/provideData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UpdateInfo extends StatefulWidget {
int index ;

  UpdateInfo({Key? key, required this.index}) : super(key: key);

  @override
  State<UpdateInfo> createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> { 
  GlobalKey<FormFieldState> SemensterKey =GlobalKey<FormFieldState>();
    GlobalKey<FormFieldState> creditunits =GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> grades =GlobalKey<FormFieldState>();


  final SemestersUpdate = TextEditingController();
  final controllerModuleTitleUpdate = TextEditingController();
  final controllerModuleCreditUnitsUpdate = TextEditingController();
  final controllerGradeAttainedUpdate = TextEditingController();
 


 List<String>Semenster= ["Semester 1","Semester 2", "Semester 3", "Semester 4"];
    List<int>Creditsunits= [1,2,3,4];

  List<String> items = ["A", "B", "C", "D", "E", "F"];
 final key = GlobalKey<FormState>();

  
    @override
    void initState() {
      super.initState();
      SemestersUpdate.text="";
      controllerGradeAttainedUpdate.text="";
      controllerModuleCreditUnitsUpdate.text="";
      controllerModuleTitleUpdate.text="";
    }
  @override
  void dispose() {

    controllerModuleTitleUpdate.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<ProvidData>(
        builder: (context, value, child) {
          print("value.course length: ${value.course.length}");
print("widget.index: ${widget.index}");
          return   Scaffold(
          backgroundColor: Colors.white,
          appBar: null,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[500],
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
                        child: Image.asset("Icons/grade.png", width: 50, height: 50),
                      ),
                      FittedBox(
                        child: Text(
                          "Update module",
                          style: TextStyle(
                            fontFamily: "SpecialElite",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Infodata(index: value.index,);
                          }));                     
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)
                          ),
                          child: Icon(Icons.close))),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
               
                
                Positioned(
                  top: 70,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Container(
                      child: Image.asset("images/Update.png", fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
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
                              child: Column(children: <Widget>[
                              Container(
                               width: MediaQuery.of(context).size.width,
                              
                                child: DropdownButtonFormField(
                                  
                                  key:SemensterKey,
      
                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
      
                                  decoration: InputDecoration(
                                    
                                    
                                    border: OutlineInputBorder(),
                                    hintText: "Semester "
                                  ),
                                  value:   null,
                                  validator: (value) {
                                  
                                    if(value=="" || value==null){
                                  return "Semester is required";
                                    }
                                    return null;
                                  },
                                  items:Semenster.map((String e) =>DropdownMenuItem(
                                    value: e,
                                    child: Text(e.toString()))).toList(), onChanged: (value) {
       setState(() {
           SemestersUpdate.text = value.toString(); // Update the selected value
          });
      
                                  }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                        controller: controllerModuleTitleUpdate,
                                                        validator: (value) {
                                if (RegExp(r'^[a-zA-Z]+$')
                                    .hasMatch(value.toString())) {
                                  return null;
                                }else if(value==null || value==""){
                                  return "Please key in";
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
                                  key:creditunits,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    
                                    border: OutlineInputBorder(),
                                    hintText: "Module Credit Units "
                                  ),
                                  value: 
                                          null,
                                            
                                  validator: (value) {
                                  
                                    if(value=="" || value==null){
                                      return "Module Credit is required";
                                    }
                                    return null;
                                  },
                                  items: Creditsunits.map((int e) =>DropdownMenuItem(
                                    value: e,
                                    child: Text(e.toString()))).toList(), onChanged: (value) {
       setState(() {
        controllerModuleCreditUnitsUpdate.text=value.toString(); // Update the selected value
          });
        }                              ),
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
                                    border: OutlineInputBorder(),
                                    hintText: "Grade Attained "
                                  ),
                                  value: null,
                                  validator: (value) {
                                  
                                    if(value==""|| value==null){
                                      return "Grade is required";
                                    }
                                    return null;
                                  },
                                  items: items.map((String e) =>DropdownMenuItem(
                                    value: e,
                                    child: Text(e.toString()))).toList(), onChanged: (value) {
                                  setState(() {
        controllerGradeAttainedUpdate.text = value.toString();
        
        },
                                );
      
                                    }
                                )
                                  ),
                              SizedBox(
                                height: 20,
                              ),
                               Center(
                                                      child: Container(
                              width: MediaQuery.of(context).size.width,
                              child:  ElevatedButton(
                                      child: Text("Update"),
                                      onPressed: () async {
                                        print("value.course length: ${value.course.length}");                                 
                                              value.index=widget.index;
                                              print(value.index);

print("widget.index: ${widget.index}");
                                        if (key.currentState!.validate()) {
                                          if (widget.index >= 0 && widget.index  < value.course.length) {
                                            value.setupdate(SemestersUpdate.text, controllerModuleTitleUpdate.text, int.parse(controllerModuleCreditUnitsUpdate.text),controllerGradeAttainedUpdate.text);
                                         print(value.course);
                                         print(value.GPAsum);
      
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return Infodata(index: value.index,);
                                        }));
                                        setState(() {
                                          SemensterKey.currentState?.reset();
                                          grades.currentState?.reset();
                                          creditunits.currentState?.reset();
                                        });
                                        
                                        
                                        }
                                        }
                                        
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        padding: EdgeInsets.all(20),
                                      ),
                                    )
                                                      ),
                                                    )
                              
                              
                              
                              
                                                      ],)),
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
        },
      )
    );
  }
}

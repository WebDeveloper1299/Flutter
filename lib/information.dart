import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mad_project/chart.dart';
import 'package:mad_project/homepagedisplay.dart';
import 'package:mad_project/provideData.dart';
import 'package:mad_project/update.dart';
import 'package:provider/provider.dart';




class Infodata extends StatefulWidget {

int index;

  Infodata({Key? key, required this.index})
      : super(key: key);

  @override
  State<Infodata> createState() => _InfodataState();
}

class _InfodataState extends State<Infodata> {

final Semesters = TextEditingController();
  final controllerModuleTitle = TextEditingController();
  final controllerModuleCreditUnits = TextEditingController();
  final controllerGradeAttained = TextEditingController();
  

 List<String>Semenster= ["Semester 1","Semester 2", "Semester 3", "Semester 4"];
    List<int>Creditsunits= [1,2,3,4];

  List<String> items = ["A", "B", "C", "D", "E", "F"];
 final key = GlobalKey<FormState>();
 final keyedit = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
print("yess");
print(widget.index);
    return  Consumer<ProvidData>(
      builder: (context, value, child) {
 
      

        return   Scaffold(
        body: value.course.isEmpty?null: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              stretch: true,
              expandedHeight: 200,
              automaticallyImplyLeading: true,
              leading: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]
                  ),
                  height:30,
                  child: GestureDetector(
                    onTap: (){
                      print("close me ah ");
                      print(value.index);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Homepartpartial(index: widget.index,);
                      }));
                    },
                    child: Icon(Icons.close, color: Colors.black, size: 25))),
              ),
              actions: [
                GestureDetector(
                  onTap: (){
                  showDialog(context: context, builder:(context){
                    return AlertDialog(
                      elevation: 10,
                      title: Text("Delete Module?"),
                     
                      icon: Icon(Icons.warning_amber, size: 30,color: Colors.orange,),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                         ElevatedButton(onPressed: (){
        Navigator.pop(context);
                        }, child: Text("No"), style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.red
        
                        ),),
                        ElevatedButton(onPressed: (){
                          try{
                          value.index=widget.index;
                              value.setremove(widget.index);
                              print("-------");
                              print(value.course);
                              print(value.index);
                              print(widget.index);
                              print(value.GPAsum);
                              print("------");
                             
                                Navigator.push(context, MaterialPageRoute(builder: (context){
         return Homepartpartial(index:value.index,);
                                }));
                          }catch(e){
                            throw Exception(e);
                          }
                               
        
                        }, child: Text("Yes"), style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),)
                      ],
        contentPadding: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                      content: Text("Are you sure to delete ?"),
                      backgroundColor: Colors.yellow,
                    );
                  });
                  },
                  child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 20),
                    child: Container(
                    
                      width: 50,
                      height:50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                
                                
                                child: Icon(Icons.delete, color: Colors.red, size: 45)),
                  ),),
              ],
              flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 2,
          background: Container(
        child: Image(
        image: AssetImage(value.course[widget.index]["Image"].toString()),
        fit: BoxFit.cover,
        width: double.infinity,
        ),
          ),
        ),
            ),
          SliverToBoxAdapter(
          child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 300,
                        height: 500,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Text("Learn the fundamentals of programming in our course! Whether you're a complete beginner or have some experience,\n this course will teach you how to write code, solve problems, and create software applications.", style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),),
                            SizedBox(height: 20,),
                            Container(
                              child: Card(
                              elevation: 10.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Column(children: <Widget>[                              
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    textDirection: TextDirection.ltr,
                                     children: [
                                       Text("Grade Information :"),
                                       SizedBox(width: 30,),
                                       Image.asset("Icons/score.png", width: 30, height: 30,)
                                     ],
                                   ),
                                  const SizedBox(
                                    height: 30,
                                   ),
      
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      textDirection: TextDirection.ltr,
                                      children: <Widget>[
                                        Text("Semester :", style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontFamily: 'Poppins-Regular'
                                        ),),
                                        SizedBox(width: 10,),
                                        Text("${value.course[widget.index]["Semester"]}", style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                       Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      textDirection: TextDirection.ltr,
                                      children: <Widget>[
                                        Text("Module Name :", style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontFamily: 'Poppins-Regular'
                                        ),),
                                        SizedBox(width: 10,),
                                        Text("${value.course[widget.index]["Moduletitle"]}", style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),),
                                      ],
                                    ),
                                      SizedBox(height: 20,),
                                       Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      textDirection: TextDirection.ltr,
                                      children: <Widget>[
                                        Text("Module Grades  :", style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontFamily: 'Poppins-Regular'
                                        ),),
                                        SizedBox(width: 10,),
                                        Text("${value.course[widget.index]["GradeAttain"]}", style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),),
                                      ],
                                    ),
                                     SizedBox(height: 20,),
                                       Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      textDirection: TextDirection.ltr,
                                      children: <Widget>[
                                        Text("Module Credit Units  :", style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontFamily: 'Poppins-Regular'
                                        ),),
                                        SizedBox(width: 10,),
                                        Text("${value.course[widget.index]["Creditunit"]}", style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                               
                                   Container(
                                    width: MediaQuery.of(context).size.width,
                                    
                                     child: ElevatedButton(
                                                                   child: Text("Edit"),
                                                                   onPressed: () {
                                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                                                      return UpdateInfo(
                                                                        index:widget.index,
                                                                      );
                                                                    }));
                                   
                                      
                                                                   },
                                                                   style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(20),
                                                                   ),
                                                              ),
                                   )
                                   
                                  
                                  
                                  
                                  
                                                          ],),
                                ),
                              ),
                            )
                           
                           
                            
                          ],
                        ),
                      ),
                    ),
          ),
            
          ],
        
      )
      );
      },
    );
  }
}

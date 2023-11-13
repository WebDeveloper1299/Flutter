
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mad_project/Addmodule.dart';
import 'package:mad_project/chart.dart';
import 'package:mad_project/information.dart';
import 'package:mad_project/onbording.dart';
import 'package:mad_project/provideData.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switcher_button/switcher_button.dart';





class  Homepartpartial extends StatefulWidget {
int index;
  Homepartpartial({Key?key, required this.index}):super(key: key);

  @override
  State<Homepartpartial> createState() => _HomepartpartialState( );
}
  PageController _pageController = PageController(initialPage: 0);
bool screen = true;
bool sort = true;
String filter ="";
final TextEditingController _searchcontroller = TextEditingController();
  int _currentIndex= 0;


class _HomepartpartialState extends State<Homepartpartial> {
  bool screen = true;

@override
void initState() {
  super.initState();
  // Use Future.delayed to execute the code after initState has completed
  Future.delayed(Duration.zero, () {
    setState(() {
      Provider.of<ProvidData>(context, listen: false).coursedata = Provider.of<ProvidData>(context, listen: false).course;
    });
  });
}

bool istaped = true;

void filter(String keyword) {

  if (keyword == "") {
    setState(() {
      Provider.of<ProvidData>(context, listen: false).coursedata = Provider.of<ProvidData>(context, listen: false).course;
    });
  } else {
   Provider.of<ProvidData>(context, listen: false).courseinfo = Provider.of<ProvidData>(context, listen: false)
        .course
        .where((module) =>
            module["Moduletitle"].toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    setState(() {
     Provider.of<ProvidData>(context, listen: false).coursedata = Provider.of<ProvidData>(context, listen: false).courseinfo;
    });
  }
}


  @override
  Widget build(BuildContext context) {     
 print(Provider.of<ProvidData>(context, listen: false).coursedata);

    return  Consumer<ProvidData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          body: screen
              ? SizedBox(
                  height: double.infinity,
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text(
                                "Track your Goals!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                               
                                value.coursedata
                                    .clear();
                               value.GPAsum.clear();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Prescreen();
                                }));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.circular(12),
                                  ),
                                  height: 50,
                                  child: Image.asset(
                                    "Icons/logout.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                        ),
                       
                         Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
  "Total GPA : ${value.GPAsum.isEmpty ? 0 : (widget.index.clamp(0, value.GPAsum.length - 1) == -1 ? 0 : value.GPAsum[widget.index.clamp(0, value.GPAsum.length - 1)])}",
  style: const TextStyle(
    fontFamily: "SpecialElite",
    fontSize: 15,
    fontWeight: FontWeight.w400,
  ),
),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "Number of Module : ${value.coursedata.length}",
                            style: const TextStyle(
                                fontFamily: "SpecialElite",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildGPAItem1(),
                                _buildGPAItem2(),
                                _buildGPAItem3(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                        .size
                                        .width *
                                    0.9,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[200],
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: SvgPicture.asset(
                                            "images/bubbles.svg",
                                            width: 30,
                                            height: 30)),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Positioned(
                                      top: 25,
                                      left: 50,
                                      child: FittedBox(
                                          child: Text(
                                        "A new Version had been updated ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      )),
                                    ),
                                    const Positioned(
                                        top: 15,
                                        right: 40,
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius:
                                        BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.grey[600],
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) =>filter(value),
                                          controller: _searchcontroller,
                                          decoration:
                                              const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                "Search for Module...",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius:
                                      BorderRadius.circular(12),
                                ),
                                height: 50,
                                child: Image.asset(
                                  "Icons/menu.png",
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text(
                                "Module",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Provider.of<ProvidData>(context, listen: false)
                                    .coursedata
                                    .isEmpty
                                ? Container()
                                : Padding(
                                    padding:
                                        const EdgeInsets.only(right: 30),
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black),
                                      onPressed: () {
                                        if (sort == true) {
                                          setState(() {
                                            sort = false;
                                          });
                                        } else {
                                          setState(() {
                                            sort = true;
                                          });
                                        }
                                      },
                                      icon: RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          Icons.compare_arrows,
                                          size: 28,
                                        ),
                                      ),
                                      label: sort
                                          ? const Text("Asecnding")
                                          : const Text("Descending"),
                                    ),
                                  )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0),
                            child:
                            
                               value.coursedata.isEmpty
                                    ? const Emptymodule()
                                    : GestureDetector(
                                        onTap: () {},
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 
                                              value.coursedata.length,
                                          itemBuilder: (context, index) {
                                            print("proble1");
                                            print(value.coursedata);
                                            print("sss");
                                            print(index);
                                                                        

                                            final sortedData =
                                                
                                                    value.coursedata;
                                            sortedData.sort((a, b) => sort
                                                ? a['Moduletitle'].compareTo(
                                                    b['Moduletitle'])
                                                : b['Moduletitle'].compareTo(
                                                    a['Moduletitle']));

                                            return Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                  //print(index);

                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) {
                                                      return Infodata(
                                                        index: index,
                                                      );
                                                    }));
                                                  },
                                                  child: Card(
                                                    elevation: 10.0,
                                                    child: Container(
                                                      height: 100,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        children: [
                                                          SizedBox(
                                                            width: 100,
                                                            height: 100,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              child: Image.asset(
                                                                  sortedData[
                                                                          index]
                                                                      [
                                                                      "Image"]
                                                                      .toString()),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <
                                                                Widget>[
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "Icons/homework.png",
                                                                      width: 30,
                                                                      height: 20,
                                                                    ),
                                                                    FittedBox(
                                                                        child:
                                                                            Text(
                                                                      "${sortedData[index]["Moduletitle"]}",
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "Icons/grade.png",
                                                                      width: 30,
                                                                      height: 20,
                                                                    ),
                                                                    FittedBox(
                                                                        child:
                                                                            Text(
                                                                      "${sortedData[index]["GradeAttain"]}",
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <
                                                                Widget>[
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "Icons/semester.png",
                                                                      width: 30,
                                                                      height: 20,
                                                                    ),
                                                                    FittedBox(
                                                                        child:
                                                                            Text(
                                                                      "${sortedData[index]["Semester"]}",
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "Icons/course.png",
                                                                      width: 30,
                                                                      height: 20,
                                                                    ),
                                                                    FittedBox(
                                                                        child:
                                                                            Text(
                                                                      "${sortedData[index]["Creditunit"]}",
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 20),
                                                            child: Icon(
                                                              Icons.arrow_forward,
                                                              size: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                          ),
                        ),
                      ],
                    )],
                  ))
              :_getScreen(value.coursedata,widget.index ,context),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                screen = true;
                if (index == 1) {
                   setState(() {
                     if(value.coursedata.isEmpty){
                      value.GPAsum.clear();
                      value.index=0;
                     }
                   });
                   
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Viewmodule(),
                  ));
               _currentIndex = 0; // Set the home icon as active

                } else if (index == 2) {
                  setState(() {
                    screen = false;
                  });
                }
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph), label: "Graph"),
            ],
          ),
        );
      },
    );
  }

      }
  
              

   
Widget _buildGPAItem1() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("Icons/3497819.jpg",fit: BoxFit.cover, width: 200, height: 200,)),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(              color: Color.fromRGBO(100, 100, 100, 0.4),

                          borderRadius: BorderRadius.circular(16),

              ),
              width: 200,
              height: 200,
            )
          )
        ],
      ),
    ),
  );
}


Widget _buildGPAItem2() {
   return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("Icons/5366119.jpg",fit: BoxFit.cover, width: 200, height: 200,)),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(              color: Color.fromRGBO(100, 100, 100, 0.4),

                          borderRadius: BorderRadius.circular(16),

              ),
              width: 200,
              height: 200,
            )
          )
        ],
      ),
    ),
  );

}


Widget _buildGPAItem3() {
   return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("images/Grade.jpg",fit: BoxFit.cover, width: 200, height: 200,)),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(              color: Color.fromRGBO(100, 100, 100, 0.4),

                          borderRadius: BorderRadius.circular(16),

              ),
              width: 200,
              height: 200,
            )
          )
        ],
      ),
    ),
  );
}


Widget _getScreen(List<Map<String, dynamic>> course, int index, context) {

  return  MyCharts(data: course, index: index, GPA:Provider.of<ProvidData>(context).GPAsum);
}

class Emptymodule extends StatelessWidget {
  const Emptymodule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: Scaffold(
        body: Center(
                    child: Container(
                      width: 200,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Image.asset("images/Empty.png")     ,
                                   Text("Add some module", style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold
                                   ),),
                  
                      ],)),
                  ) ,
      ),
    );
  }
}
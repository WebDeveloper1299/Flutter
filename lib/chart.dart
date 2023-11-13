import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyCharts extends StatefulWidget {
  final List<Map<String, dynamic>> data;
   int index=0;
  List<String> GPA;

  MyCharts({Key? key, required this.data, required this.index, required this.GPA}) : super(key: key);

  @override
  State<MyCharts> createState() => _MyChartsState();
}

double convertGpaToPercentage(double gpa) {
  // Assuming a 4.0 GPA scale
  const double maxGpa = 4.0;
  
  // Convert GPA to percentage with three decimal places
  double percentage = (gpa / maxGpa) * 100.0;
  return double.parse(percentage.toStringAsFixed(3));
}

class _MyChartsState extends State<MyCharts> {
  List<ChartData> baardata = [];

  @override
  void initState() {
    super.initState();

   for (int i = 0; i < widget.GPA.length; i++) {
  double gpaValue = double.tryParse(widget.GPA[i]) ?? 0.0;
  baardata.add(ChartData(GPApercent: convertGpaToPercentage(gpaValue), Id: i));
}

  }

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:widget.data.isEmpty
              ? Emptycharts()
              :  Center(
          child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Center(
                          child: Text(
                            "Percentage of GPA for each Semester Module  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins-Regular",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                       widget.data.isEmpty
                            ? Emptycharts()
                            : SizedBox(
                                height: 200,
                                child: PieChart(
                                
                                  swapAnimationCurve: Curves.easeInOut,
                                  swapAnimationDuration: Duration(milliseconds: 500),
                                  PieChartData(
                                    
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    centerSpaceColor: Colors.grey[400],
                                    sectionsSpace: 10,
                                    centerSpaceRadius: 40.0,
                                    sections: [
  for (int i = 0; i < widget.data.length; i++)
    PieChartSectionData(
      showTitle: true,
      title:  convertGpaToPercentage(double.parse(widget.GPA[i])).toString(),
      color: widget.data[i]["Colors"],
      radius: 60,
      titlePositionPercentageOffset: 0.5,
      value: double.parse(widget.GPA[i]).isNaN
          ? 0.0  // Handle NaN separately
          : convertGpaToPercentage(double.parse(widget.GPA[i])),
    ),
],
                                  
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 40,
                        ),
                        widget.data.isEmpty || widget.GPA.isEmpty
                            ? Container()
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                child: BarChart(
                                  swapAnimationCurve: Curves.easeInOut,
                                  swapAnimationDuration: Duration(milliseconds: 500),
                                
                                  BarChartData(
                                  
                                  
                                    borderData: FlBorderData(show: false),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      topTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          getTitlesWidget:(value, meta) {
    if (value >= 0 && value < baardata.length) {
          // Use the module name as the label
          return Text("Grade: ${widget.data[value.toInt()]["GradeAttain"].toString()}");
        }
        return Text("");
      },
  showTitles: true
                                        )
                                      ),
                                      bottomTitles: AxisTitles(
 sideTitles: SideTitles(
  getTitlesWidget:(value, meta) {
    if (value >= 0 && value < baardata.length) {
          // Use the module name as the label
          return Text("${widget.data[value.toInt()]["Moduletitle"].toString()}");
        }
        return Text("");
      },
  showTitles: true
 )

                                      ),
                                    ),
                                    minY: 0,
                                    maxY: 100,
                                    barGroups: baardata.isNotEmpty?baardata
                                        .map(
                                          (e) => BarChartGroupData(
                                            x: e.Id.toInt(),
                                            barRods: [
                                              BarChartRodData(
                                                toY: e.GPApercent,
                                                color: Colors.red,
                                                width: 25,
                                                borderRadius: BorderRadius.circular(4),
                                                backDrawRodData: BackgroundBarChartRodData(
                                                  show: true,
                                                  toY: 100,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).where((group) => group.x >= 0 && group.x < widget.data.length)
                                        .toList():[],
                                  ),
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

class ChartData {
  final double GPApercent;
  final int Id;

  ChartData({
    required this.GPApercent,
    required this.Id,
  });
}

class Emptycharts extends StatelessWidget {
  const Emptycharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/no_data.jpg"),
            Text(
              "Empty Data , Please Add some module to view ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Regular',
              ),
            )
          ],
        ),
      ),
    );
  }
}

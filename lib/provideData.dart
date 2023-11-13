import 'package:flutter/material.dart';

class ProvidData extends ChangeNotifier {
  List<Map<String, dynamic>> course = [];
   List<Map<String, dynamic>> coursedata = [];
  List<Map<String, dynamic>> courseinfo = [];
 List<ChartData> baardata = [];

  List<String> GPAsum = [];
  int index = 0;
 
setupdate(String semester, String modoulename, int Credit, String Grade){
course[index]["Semester"] = semester;
course[index]["Moduletitle"] = modoulename;
course[index]["Creditunit"]= Credit;
course[index]["GradeAttain"]  = Grade;
setGPACalculate();
notifyListeners();
}

setremove(int index){
course.removeAt(index);
GPAsum.removeAt(index);
notifyListeners();

}

  setAddCourse(
      int id, String semester, String modoulename, int Credit, String Grade, String images, Color colors) {
    final data = {
      "Id": id,
      "Semester": semester,
      "Moduletitle": modoulename,
      "Creditunit": Credit,
      "GradeAttain": Grade,
      "Image": images,
      "Colors": colors,
    };
    course.add(data);
    notifyListeners();
  }
  
void setGPACalculate() {
  List<String> grades = [];
  List<int> gradesPoint = [];
  List<int> totalCreditUnitsAttempted = [];
  int totalcreditunits = 0;
  int totalscore = 0;

  for (int i = 0; i < course.length; i++) {
    try {
      totalCreditUnitsAttempted.add(int.parse(course[i]["Creditunit"].toString()));
      grades.add(course[i]["GradeAttain"].toString().toLowerCase());
    } catch (e) {
      print("Invalid value in reportData: $e");
    }
  }

  for (int i = 0; i < grades.length; i++) {
    switch (grades[i]) {
      case "a":
        gradesPoint.add(4);
        break;
      case "b":
        gradesPoint.add(3);
        break;
      case "c":
        gradesPoint.add(2);
        break;
      case "d":
        gradesPoint.add(1);
        break;
      case "e":
        gradesPoint.add(1);
        break;
      case "f":
        gradesPoint.add(0);
        break;
      default:
        gradesPoint.add(0); // Assign a default value for unknown grades
        break;
    }
  }

  for (int i = 0; i < gradesPoint.length; i++) {
    totalcreditunits += totalCreditUnitsAttempted[i];
    totalscore += totalCreditUnitsAttempted[i] * gradesPoint[i];
  }

  // Check if GPA sum for the current course already exists
  if (index >= 0 && index < GPAsum.length) {
    // Update the existing GPA sum
    GPAsum[index] = (totalscore / totalcreditunits).toStringAsFixed(3);
  } else {
    // Add a new GPA sum
    GPAsum.add((totalscore / totalcreditunits).toStringAsFixed(3));
  }

  notifyListeners();
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

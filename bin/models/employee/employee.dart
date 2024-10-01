import '../../domain/hr_manager.dart';
const Map<int, String> monthsInYear = {
  1: "January",
  2: "February",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December"
};


abstract class Employee {
  bool isPermenant=true;
  String name;
  String email;
  int ?employeeId;
  int performanceScore=0;
  int departmentid;
  DateTime hireDate=DateTime.now();
  Map<int, int> monthPerformanceScore = {
  1:0,
  2:0,
  3:0,
  4:0,
  5:0,
  6:0,
  7:0,
  8:0,
  9:0,
  10:0,
  11:0,
  12:0
};
  Employee(this.name,this.email,this.departmentid,{hireDate}){employeeId=HrManager.employeeIndex;}

  double calculateSalary();  
  void deductMoney(double moneyTodDeduct);
  void showEmployeeDetails();
  void addPerformanceScore(int performanceScoreToAdd) {
  if(performanceScore+performanceScoreToAdd<6){performanceScore+=performanceScoreToAdd;}
  else {performanceScore=5;}
  }
  void supPerformanceScore(int performanceScoreToSub) {
  if(performanceScore-performanceScoreToSub<0){performanceScore-=performanceScoreToSub;}
  else {performanceScore=0;}
  }
  void clearPerformanceScore() {
    performanceScore=0;
  }
  static void monthlyReport(int employeeId,int month)
  {
    Employee? employee=HrManager.employeeMap[employeeId];
    print("""
Id : $employeeId
Month :${monthsInYear[month]}
Score :${employee?.monthPerformanceScore[month]}
""");
  }


  


}
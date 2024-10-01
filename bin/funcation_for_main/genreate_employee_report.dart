import 'dart:io';
import '../domain/hr_manager.dart';
import '../models/employee/employee.dart';
void genreateEmployeeReport(){
  print("What the id of the Employee you want to his report?");
  for(Employee e in HrManager.employeeMap.values){
    print("${e.employeeId}: ${e.name}\n");
  }
  int chosenEmployeeId=int.parse(stdin.readLineSync()!);

  if(HrManager.employeeMap.containsKey(chosenEmployeeId)){
    print("Which month do you want to see the report for?");
    monthsInYear.forEach((key, value) {
      print("$key: $value\n");
    });
    int chosenMonth=int.parse(stdin.readLineSync()!);
    print("=======================> Report for ${HrManager.employeeMap[chosenEmployeeId]?.name} <=======================");
    Employee.monthlyReport(chosenEmployeeId,chosenMonth);
  }
  else{print("Thare is no employee with that id! \nTry again");genreateEmployeeReport();}

  }


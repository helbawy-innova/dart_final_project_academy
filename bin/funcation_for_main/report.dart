import 'dart:io';
import 'genreate_department_report.dart';
import 'genreate_employee_report.dart';
void report(){
  print("\n[1]Employee monthly report\n[2]department monthly report\n");
  int chosenReportType=int.parse(stdin.readLineSync()!);
  if(chosenReportType==1){
    genreateEmployeeReport();
  }
  else if(chosenReportType==2){
    generateDepartmentReport();
  }
  else{
    print("Wrong input!\nTry again");
    report();
  }
}
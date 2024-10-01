import 'dart:io';
import '../models/employee/permenant_employee.dart';
import '../models/employee/contract_employee.dart';
import '../domain/hr_manager.dart';
void exportEmployeeMonthlyReport(){
  print("What the id of the Employee you want to his report?");
  int chosenEmployeeId=int.parse(stdin.readLineSync()!); 

  bool chosenEmployeeType=false;
  try{
  chosenEmployeeType=HrManager.employeeMap[chosenEmployeeId]!.isPermenant;
  }
  catch(e){
    print("Wrong input!\ntry again");
    exportEmployeeMonthlyReport();
  }
  if(!chosenEmployeeType){
    ContractEmployee? employee=HrManager.employeeMap[chosenEmployeeId] as ContractEmployee?;
    employee?.exportToJson();
    employee?.exportToTxt();
  }
  // ignore: dead_code
  else if(chosenEmployeeType){
    PermenantEmployee? employee=HrManager.employeeMap[chosenEmployeeId] as PermenantEmployee?;
    employee?.exportToJson();
    employee?.exportToTxt();
  }
  else{
    print("Wrong input!\ntry again");
    exportEmployeeMonthlyReport();
  }
}
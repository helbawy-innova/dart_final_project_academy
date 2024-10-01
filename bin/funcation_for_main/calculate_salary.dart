import 'dart:io';
import '../domain/hr_manager.dart';
void calculateSalary(){
  print("What the employee ID?");
  int chosenEmployeeId=int.parse(stdin.readLineSync()!);
  if(HrManager.employeeMap.containsKey(chosenEmployeeId)){
  double? employeeSalary=  HrManager.getEmployeeById(chosenEmployeeId)?.calculateSalary();
  print("The Salary for this employee is $employeeSalary\$\n");
  }
  else{print("Thare is no employee with that id! \nTry again");calculateSalary();}
  
}
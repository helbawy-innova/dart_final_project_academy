import 'dart:io';
import '../domain/hr_manager.dart';
void showEmployeeDetails(){
  print("What the id of the Employee his report you want to show?");
  int chosenEmployeeId=int.parse(stdin.readLineSync()!);
  if(HrManager.employeeMap.containsKey(chosenEmployeeId)){
    HrManager.employeeMap[chosenEmployeeId]?.showEmployeeDetails();
  }
  else{print("Thare is no employee with that id! \nTry again");showEmployeeDetails();}

}
import 'dart:io';
import '../domain/hr_manager.dart';
void removeEmpoyeeform(){
  print("What the id of the Employee you want to Remove?");
  int chosenEmployeeId=int.parse(stdin.readLineSync()!);
  if(HrManager.employeeMap.containsKey(chosenEmployeeId)){
    HrManager.deleteEmployee(chosenEmployeeId);
    print("Employee with id $chosenEmployeeId removed successfully");
    }

  else{print("Thare is no employee with that id! \nTry again");removeEmpoyeeform();}
}
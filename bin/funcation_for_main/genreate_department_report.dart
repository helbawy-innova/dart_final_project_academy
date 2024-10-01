import 'dart:io';
import '../domain/hr_manager.dart';

void generateDepartmentReport(){
  print("What the id of the Department you want to his report?${HrManager.showAvailableDepartments()}\nEnter number ")  ;
  int chosenDepartmentId=int.parse(stdin.readLineSync()!);
  if(HrManager.dpartmentMap.containsKey(chosenDepartmentId)){
    print("=======================> Report for ${HrManager.dpartmentMap[chosenDepartmentId]?.name} department <=======================");
    print(HrManager.dpartmentMap[chosenDepartmentId]?.makeEmployeesDepartmentList());
  }
  else{print("Thare is no department with that id! \nTry again");generateDepartmentReport();}
}
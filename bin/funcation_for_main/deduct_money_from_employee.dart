import 'dart:io';
import '../domain/hr_manager.dart';
import '../models/employee/employee.dart';
void deductMoneyFromEmployee(){
  
  print("What the id of the Employee you want to Deduct money from?");
  for(Employee e in HrManager.employeeMap.values){
    print("${e.employeeId}: ${e.name}");
  }
  int chosenEmployeeId=int.parse(stdin.readLineSync()!);
  
  if(HrManager.employeeMap.containsKey(chosenEmployeeId)){
    print("What the amount of money you want to Deduct?");
    double amountToDeduct=double.parse(stdin.readLineSync()!);

    HrManager.employeeMap[chosenEmployeeId]?.deductMoney(amountToDeduct);
    print("Employee with id $chosenEmployeeId deducted money successfully");
    }
}
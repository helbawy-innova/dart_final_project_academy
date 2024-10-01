import 'dart:convert';
import 'dart:io';

import 'employee.dart';
import '../../domain/hr_manager.dart';
class ContractEmployee extends Employee{
  DateTime contracteEndDate;
  double hoursRate;
  late double hoursWorked=0;
  ContractEmployee(super.name, super.email,super.departmentid,this.hoursRate,this.contracteEndDate,{this.hoursWorked=0}){
    isPermenant=false;
    HrManager.addEmployee(this);
    HrManager.dpartmentMap[departmentid]?.addEmployee(this);
    print("\nEmployee has been made successfully his id is $employeeId");
    HrManager.employeeIndex++;
  }


  @override double calculateSalary() {
  return hoursRate*hoursWorked;
  }

  @override 
  void deductMoney(double moneyTodDeduct){
  }

  @override
  void showEmployeeDetails() {
String formattedHireDate = hireDate.toIso8601String().split('T').first;
String formattedEndDate = contracteEndDate.toIso8601String().split('T').first;
  print("""
==============EmployeeDetails==============
Name:$name
Email:$email
ID:$employeeId
Performance score:$performanceScore
Department:${HrManager.dpartmentMap[departmentid]?.name}
Work Type:Contract Employee
Hire Date:$formattedHireDate
Hours Rate:$hoursRate
Hours Worked:$hoursWorked
Contracte End Date:$formattedEndDate
===========================================
""");}



  void addWorkedHours(int workedHours){
    hoursWorked+=workedHours;
  }

   
   void exportToJson() {
    Map<String, dynamic> jsonData = {
      'employeeId': employeeId,
      'employeeName': name,
      'workedHours' :hoursWorked,
    };

    String jsonString = jsonEncode(jsonData);

  Directory directory = Directory('employee_data');

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  File jsonFile = File('${directory.path}/${name}_report.json');

    jsonFile.writeAsStringSync(jsonString);
    print('Employee report for $name exported as JSON');
  }   
   void exportToTxt()  {
    String txtString =
"""
Employee ID: $employeeId
Employee Name: $name
Worked hours: $hoursWorked""";

  Directory directory = Directory('employee_data');
    if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
    File txtFile = File('${directory.path}/${name}_report.txt');
    txtFile.writeAsStringSync(txtString);

    print('Employee report for $name exported as TXT');
  }
}
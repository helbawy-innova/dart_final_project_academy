import 'dart:convert';
import 'dart:io';
import 'employee.dart';
import '../../domain/hr_manager.dart';

class PermenantEmployee extends Employee{
  double salary;
  List<String> benefits;
  double deductionsTotal=0;
  //benefits need more thinking
  PermenantEmployee(super.name, super.email,super.departmentid,this.benefits,this.salary){
    HrManager.addEmployee(this);
    HrManager.employeeIndex++;
    print("\nEmployee has been made successfully his id is $employeeId");
  }

  @override 
  void deductMoney(double moneyTodDeduct){
    deductionsTotal+=moneyTodDeduct;
  }

  @override 
  double calculateSalary() {
    return salary-deductionsTotal;
  }

  @override
   void showEmployeeDetails() {
    String formattedHireDate = hireDate.toIso8601String().split('T').first;
    print("""
==============EmployeeDetails==============
Name:$name
Email:$email
ID:$employeeId
Performance score:$performanceScore
Department:${HrManager.dpartmentMap[departmentid]?.name}
Work Type:Contract Employee
Hire Date:$formattedHireDate
Salary:$salary
Benefits:$benefits
Deductions Total:$deductionsTotal
Salary After Deduction:$salary
===========================================
""");}
  
   void exportToJson() {
    Map<String, dynamic> jsonData = {
      'employeeId': employeeId,
      'employeeName': name,
      'Salary' :salary-deductionsTotal,
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
Salary: ${salary-deductionsTotal}""";

 Directory directory = Directory('employee_data');
    if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
    File txtFile = File('${directory.path}/${name}_report.txt');
     txtFile.writeAsStringSync(txtString);

    print('Employee report for $name exported as TXT');
  }
}
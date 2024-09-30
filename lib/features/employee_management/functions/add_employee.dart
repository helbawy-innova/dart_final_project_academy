import 'dart:io';

import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';
import 'package:dart_final_project/handlers/format_date.dart';
import 'package:dart_final_project/models/contract_employee.dart';
import 'package:dart_final_project/models/permanent_employee.dart';

void addEmployee(
  HrManager hr,
  FileManager fileManager
) {
  print('Add Employee:');
  print('Enter Employee Type:');
  print('1. Permanent Employee');
  print('2. Contract Employee');
  var employeeType = int.parse(stdin.readLineSync()!);
  switch (employeeType) {
    case 1:
      {
        print('Permanent Employee:');

        addPermanentEmployee(
          hr, fileManager
        );
        break;
      }
    case 2:
      {
        addContractEmployee(
          hr, fileManager
        );

        break;
      }
    default:
      print('Invalid Employee Type');
  }
}

void addContractEmployee(HrManager hr ,FileManager fileManager) {
  print('Contract Employee:');

  print('Enter Employee ID:');
  int id = int.parse(stdin.readLineSync()!);
  print('Enter Employee Name:');
  String name = stdin.readLineSync()!;
  print('Enter Employee Email:');
  String email = stdin.readLineSync()!;
  print('Enter Employee Department ID:');
  int departmentId = int.parse(stdin.readLineSync()!);
  //TODO: add hire date validation
  print(
      'Enter Employee Hire Date (write the date in this format: YYYY-MM-DD):');
  DateTime hireDate = formatDate(stdin.readLineSync()!);
  print('Enter Employee Performance Score:');
  int performanceScore = int.parse(stdin.readLineSync()!);
  print('Enter Employee hourlyRate:');
  double hourlyRate = double.parse(stdin.readLineSync()!);
  print('Enter Employee hoursWorked:');
  double hourlyWorked = double.parse(stdin.readLineSync()!);
  print('Enter contract end date (write the date in this format: YYYY-MM-DD):');
  DateTime contractEndDate = formatDate(stdin.readLineSync()!);
  ContractEmployee employee = ContractEmployee(
      id: id,
      name: name,
      email: email,
      departmentId: departmentId,
      hireDate: hireDate,
      performanceScore: performanceScore,
      hourlyRate: hourlyRate,
      hoursWorked: hourlyWorked,
      contractEndDate: contractEndDate);
  hr.addEmployee(employee, fileManager);
  /*  fileManager.exportEmployeesToJson(hr.employees!.values.toList(), 'employee.json'); */
}

void addPermanentEmployee(HrManager hr, FileManager fileManager) {
  print('Enter Employee ID:');
  int id = int.parse(stdin.readLineSync()!);
  print('Enter Employee Name:');
  String name = stdin.readLineSync()!;
  print('Enter Employee Email:');
  String email = stdin.readLineSync()!;
  print('Enter Employee Department ID:');
  int departmentId = int.parse(stdin.readLineSync()!);
  //TODO: add hire date validation
  print(
      'Enter Employee Hire Date (write the date in this format: YYYY-MM-DD):');
  DateTime hireDate = formatDate(stdin.readLineSync()!);
  print('Enter Employee Performance Score:');
  int performanceScore = int.parse(stdin.readLineSync()!);
  print('Enter Employee Salary:');
  double salary = double.parse(stdin.readLineSync()!);
  print('Enter Employee Benefits number:');
  int benefits = int.parse(stdin.readLineSync()!);
  print('Enter Employee Benefits:');
  List<String> benefitsList = [];
  for (var i = 0; i < benefits; i++) {
    print('Enter Benefit ${i + 1}:');
    benefitsList.add(stdin.readLineSync()!);
  }

  PermanentEmployee employee = PermanentEmployee(
      id: id,
      name: name,
      email: email,
      departmentId: departmentId,
      hireDate: hireDate,
      performanceScore: performanceScore,
      salary: salary,
      benefits: benefitsList);

  hr.addEmployee(employee, fileManager);

  /*  fileManager.exportEmployeesToJson(hr.employees!.values.toList(), 'employee.json'); */
}

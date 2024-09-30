import 'dart:io';

import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';

void showDepartmentEmployeesById(HrManager hr, FileManager fileManager) {
  print('Show Department Employees:');
  print('1. HR');
  print('2. Engineering');
  print('3. Marketing');
  print('4. Sales');
  print('5. Finance');
  print('Enter Department ID:');
  int departmentId = int.parse(stdin.readLineSync()!);
  hr.getEmployeesByDepartmentId(departmentId);
  fileManager.getEmployeesByDepartmentId(departmentId).then((value) {
    print('value $value');
  });
}

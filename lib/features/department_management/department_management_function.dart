import 'dart:io';

import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';
import 'package:dart_final_project/features/department_management/functions/show_department_employees_by_id.dart';

void departmentManagementFunction(HrManager hr, FileManager fileManager) {
 try{ print('Department Management:');
  print('1. Show Department Employees');
  print('2. Exit');
  print('Enter services number:');
  var option = int.parse(stdin.readLineSync()!);
  switch (option) {
    case 1:
      {
        showDepartmentEmployeesById(hr, fileManager);

        break;
      }
    case 2:
      {
        print('Exit');
        continueService = false;
        break;
      }
    default:
      print('Invalid Option');
  }}
  catch (e) {
    print('Invalid input');
  }
}


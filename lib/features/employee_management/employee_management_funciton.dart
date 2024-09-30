import 'dart:io';

import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';
import 'package:dart_final_project/features/employee_management/functions/add_employee.dart';
import 'package:dart_final_project/features/employee_management/functions/delete_employee.dart';

void employeeManagement(HrManager hr, FileManager fileManager) {
try{  print('1. Add Employee');
  print('2. Delete Employee');
  print('3. Generate Company Report');
  print('4. Get Employees By Department ID');
  print('5. Export Employees To JSON');
  print('6. Import Employees From JSON');
  print('7. Exit');
  print('Enter services number:');
  var option = int.parse(stdin.readLineSync()!);

  switch (option) {
    case 1:
      addEmployee(hr, fileManager);
      break;
    case 2:
      {
        deleteEmployee(hr, fileManager);
        break;
      }

    case 3:
      print('Generate Company Report:');
      hr.generateCompanyReport();
      break;
    case 4:
      print('Get Employees By Department ID:');
      print('Enter Department ID:');
      int departmentId = int.parse(stdin.readLineSync()!);
      print(hr.getEmployeesByDepartmentId(departmentId));

      break;
    case 5:
      {
        print('Export Employees to Json:(data will appear after exit the program)');
        /*  print('hr em ${hr.employees!.values.toList()}'); */
        fileManager.exportEmployeesToJson(
            hr.employees!.values.toList(), 'employee.json');

        break;
      }
    case 6:
      {
        print('Import Employees to Json:(data will appear after exit the program)');
        fileManager.importEmployeesFromJson('employee.json').then((value) {
          print('value $value');
        });
        break;
      }
    case 7:
      {
        print('Exit');
        continueService = false;
        break;
      }
    default:
      print('Invalid Option');
  }}
  catch(e){
    print('Invalid Input');
  }
}

import 'dart:io';

import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';

void filesManagement(HrManager hr, FileManager fileManager) {
try{  print('Files Management:');
  print('1. Export Employees to Json');
  print('2. Import Employees from Json');
  print('3. Export Employees to TXT');
  print('4. Exit');
  print('Enter services number:');
  var option = int.parse(stdin.readLineSync()!);
  switch (option) {
    case 1:
      {
        print('Export Employees to Json:(data will appear after exit the program)');
       fileManager.exportEmployeesToJson(
           [], 'employee.json');
        break;
      }
    case 2:
      {
        print('Import Employees to Json:(data will appear after exit the program)');
        fileManager.importEmployeesFromJson('employee.json').then((value) {
          print('value $value');
        });
        break;
      }
      case 3:
      {
        print('Export Employees to txt:(data will appear after exit the program)');
       fileManager.exportEmployeesToTxt(
           [], 'employee.json');
        break;
      }
    case 4:
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
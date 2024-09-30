import 'dart:io';

import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';
import 'package:dart_final_project/features/department_management/department_management_function.dart';
import 'package:dart_final_project/features/employee_management/employee_management_funciton.dart';
import 'package:dart_final_project/features/files_management/files_management_function.dart';
import 'package:dart_final_project/features/performance_tracking/performance_tracking_function.dart';

void chooseUserService(HrManager hr, FileManager fileManager) {
  try {
    print(
        'Hello HR! how can I help you today?can you choose one of the following options?');
    print('1. Employee Management');
    print('2. Performance tracking');
    print('3. Department Management');
    print('4. Files Management');
    print('5. Exit');
    stdout.write('Enter Option Number: ');
    var option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        print('Employee Management:');
        employeeManagement(hr, fileManager);
        break;
      case 2:
        print('Performance tracking');
        performanceTracking(hr);
        break;
      case 3:
        print('Department Management');
        departmentManagementFunction(hr, fileManager);
        break;
      case 4:
        print('Files Management');
        filesManagement(hr, fileManager);
        break;
      case 5:
        {
          continueService = false;
          print('Exit');
          break;
        }

      default:
        print('Invalid Option');
    }
  } catch (e) {
    print('Invalid input');
  }
}

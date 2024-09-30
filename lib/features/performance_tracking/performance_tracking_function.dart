import 'dart:io';

import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/hr_manager.dart';

void performanceTracking(HrManager hr) {
 try{ print('Performance Tracking:');
  print('1. Add Performance Score');
  print('2. Sub Performance Score');
  print('3. Clear Performance Score');
  print('4. Show Performance Score');
  print('5. Exit');
  print('Enter services number:');
  int serviceNumber = int.parse(stdin.readLineSync()!);
  print('Enter Employee ID:');
  int employeeId = int.parse(stdin.readLineSync()!);

  switch (serviceNumber) {
    case 1:
      {
        print('Add Performance Score:');
        print('Enter Performance Score:');
        int performanceScore = int.parse(stdin.readLineSync()!);
        hr.employees!.values
            .toList()[employeeId]
            .addPerformanceScore(performanceScore);
        break;
      }
    case 2:
      {
        print('Add Performance Score:');
        print('Enter Performance Score:');
        int performanceScore = int.parse(stdin.readLineSync()!);
        hr.employees!.values
            .toList()[employeeId]
            .subPerformanceScore(performanceScore);
        break;
      }

    case 3:
      {
        hr.employees!.values.toList()[employeeId].clearPerformanceScore();
        break;
      }
    case 4:
      {
        hr.employees!.values.toList()[employeeId].showPerformanceScore();
        break;
      }
    case 5:
      {
        print('Exit');
        continueService = false;
        break;
      }
  }}
  catch (e) {
    print('Invalid input');
  }
}

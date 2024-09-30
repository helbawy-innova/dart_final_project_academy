import 'dart:io';

import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';

void deleteEmployee(
    HrManager hr,
    /* FileManager fileManager */
   
    FileManager fileManager) {
      print('Delete Employee:');
        print('Enter Employee ID:');
        int id = int.parse(stdin.readLineSync()!);
  hr.deleteEmployee(id, fileManager);
}


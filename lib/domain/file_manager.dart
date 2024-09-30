import 'dart:convert';
import 'dart:io';

import 'package:dart_final_project/models/employee.dart';

class FileManager {
  exportEmployeesToJson(List<Employee> employees, String filePath) async {
    try {
      if (employees.isEmpty) {
        print('No new employees to export');
      }
      File file = File(filePath);
      File txtFile = File(filePath.replaceFirst('json', 'txt'));
      if (await file.exists() == false) {
        file.create();
      }
      if (await txtFile.exists() == false) {
        txtFile.create();
      }

      String fileContent = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(fileContent);
      // List<dynamic> txtData = jsonDecode(txtFileContent);

      jsonData.addAll(employees.map((e) => e.toJson()).toList());
      //  txtData.addAll(employees.map((e) => e.toJson()).toList());

      print(jsonData);
      txtFile.writeAsString(jsonData.toString());
      return file.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      print("Error: $e");
    }
  }

  exportEmployeesToTxt(List<Employee> employees, String filePath) async {
    try {
      if (employees.isEmpty) {
        print('No new employees to export');
      }
      File file = File(filePath);
      File txtFile = File(filePath.replaceFirst('json', 'txt'));
      if (await file.exists() == false) {
        file.create();
      }
      if (await txtFile.exists() == false) {
        txtFile.create();
      }

      String fileContent = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(fileContent);

      jsonData.addAll(employees.map((e) => e.toJson()).toList());
      print(jsonData);
      file.writeAsString(jsonEncode(jsonData));

      return txtFile.writeAsString(jsonData.toString());
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<Employee>> importEmployeesFromJson(String filePath) async {
    try {
      File file = File(filePath);
      String fileContent = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(fileContent);

      List<Employee> employees = [];
      for (var data in jsonData) {
        employees.add(Employee.fromJson(data));
      }

      return employees;
    } catch (e) {
      throw Exception('Error importing data: $e');
    }
  }

  Future<List<Employee>> getEmployeesByDepartmentId(int departmentId) async {
    try {
      File file = File('employee.json');
      String fileContent = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(fileContent);

      List<Employee> employees = [];
      for (var data in jsonData) {
        if (data['departmentId'] == departmentId) {
          employees.add(Employee.fromJson(data));
        }
      }
      for (var employee in employees) {
        print(
            "${employee.name} : ${employee.id}: ${employee.performanceScore}");
      }

      return employees;
    } catch (e) {
      throw ("Error: $e");
    }
  }

  Future<void> deleteEmployee(/* List<Employee> employees, */ int id) async {
    try {
      /* if (employees.isEmpty) {
        throw Exception('No employees to export');
      } */
      File file = File('employee.json');
      if (await file.exists() == false) {
        file.create();
      }

      String fileContent = await file.readAsString();

      List<dynamic> jsonData = jsonDecode(fileContent);

      /* jsonData.addAll(employees.map((e) => e.toJson()).toList()); */
      jsonData.removeWhere((element) => element == id);
      print(jsonData);
      file.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      print("Error: $e");
    }
  }

  void generateCompanyReport() {}
}

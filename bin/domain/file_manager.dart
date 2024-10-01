import 'dart:convert';
import 'dart:io';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/employee.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/department.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/contract_employee.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/permanent_employee.dart';
class FileManager {
  String employeename;
  String departmentnames;
  FileManager(this.employeename, this.departmentnames);
  void saveAllData(List<Employee> employees, List<Department> departments) {
    final employeeFile = File(employeename);
    final employeeJsonData = jsonEncode(employees.map((e) => e.toJson()).toList());
    employeeFile.writeAsStringSync(employeeJsonData);
    final departmentFile = File(departmentnames);
    final departmentJsonData = jsonEncode(departments.map((e) => e.toJson()).toList());
    departmentFile.writeAsStringSync(departmentJsonData);
  }
  Future<List<Employee>> loadEmployeesFromFile() async {
    final file = File(employeename);
    List<Employee> employees = [];

    if (await file.exists()) {
      final jsonData = await file.readAsString();
      List<dynamic> data = jsonDecode(jsonData);
      for (var employeeData in data) {
        if (employeeData['type'] == 'Permanent') {
          employees.add(PermanentEmployee(
            id: employeeData['id'],
            name: employeeData['name'],
            departmentId: employeeData['departmentId'],
            hireDate: employeeData['hireDate'],
            email: employeeData['email'],
            salary: employeeData['salary'],
            benefits: List<String>.from(employeeData['benefits']),
          ));
        } else if (employeeData['type'] == 'Contract') {
          employees.add(ContractEmployee(
            id: employeeData['id'],
            name: employeeData['name'],
            departmentId: employeeData['departmentId'],
            email: employeeData['email'],
            hireDate: employeeData['hireDate'],
            hoursWorked: employeeData['hourlyRate'],
            contractEndDate: employeeData['contractEndDate'],
          ));
        }
      }
      print('Data loaded from file: $employeename');
    } else {
      print('No file with name: $employeename');
    }
    return employees;
  }
  List<Department> loadDepartmentsFromFile() {
    final file = File(departmentnames);
    List<Department> departments = [];

    if (file.existsSync()) {
      final jsonData = file.readAsStringSync();
      List<dynamic> data = jsonDecode(jsonData);
      for (var departmentData in data) {
        departments.add(Department(
          departmentname: departmentData['name'],
          id: departmentData['id'], employees: [],
        ));
      }
      print('Data loaded from file: $departmentnames');
    } else {
      print('No file with name: $departmentnames');
    }
    return departments;
  }

  void exportEmployeesToJson(List<Employee> employees, String filePath) {
    List<Map<String, dynamic>> jsonList = employees.map((e) => e.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    File(filePath).writeAsStringSync(jsonString);
  }
}
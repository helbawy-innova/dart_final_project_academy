import 'dart:convert';
import 'dart:io';

void main() async {
  List<Employee> employees = [];
  List<Performance> performances = [];
  bool running = true;
  String fileName = 'employees.json';

  
  employees = await FileManager.importFromJson(fileName);

  while (running) {
    print('\nChoose an option:');
    print('1. Add Employee');
    print('2. Track Performance');
    print('3. Export Employees to JSON');
    print('4. Export Employees to TXT');
    print('5. Import Employees from JSON');
    print('6. Display Employees');
    print('7. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('1. Permanent Employee');
        print('2. Contract Employee');
        String? empType = stdin.readLineSync();

        print('Enter name:');
        String? name = stdin.readLineSync();
        print('Enter ID:');
        int id = int.parse(stdin.readLineSync()!);
        print('Enter department:');
        String? department = stdin.readLineSync();
        print('Enter hire date (YYYY-MM-DD):');
        DateTime hireDate = DateTime.parse(stdin.readLineSync()!);

        if (empType == '1') {
          print('Enter salary:');
          double salary = double.parse(stdin.readLineSync()!);
          print('Enter benefits (comma separated):');
          List<String> benefits = stdin.readLineSync()!.split(',');

          var newEmployee = PermanentEmployee(
              name!, id, department!, hireDate, salary, benefits);
          employees.add(newEmployee);

          
          newEmployee.displayInfo();
        } else if (empType == '2') {
          print('Enter contract end date (YYYY-MM-DD):');
          DateTime contractEndDate = DateTime.parse(stdin.readLineSync()!);
          print('Enter hourly rate:');
          double hourlyRate = double.parse(stdin.readLineSync()!);

          var newEmployee = ContractEmployee(
              name!, id, department!, hireDate, contractEndDate, hourlyRate);
          employees.add(newEmployee);

          
          newEmployee.displayInfo();
        }

        print('Employee added successfully!');

        
        await FileManager.exportToJson(employees, fileName);
        break;

      case '2':
        print('Enter employee ID:');
        int empId = int.parse(stdin.readLineSync()!);
        Employee? employee =
            employees.firstWhere((e) => e.id == empId, orElse: () => null!);

        if (employee != null) {
          print('Enter performance score (1-5):');
          int score = int.parse(stdin.readLineSync()!);
          print('Enter month:');
          String? month = stdin.readLineSync();

          performances.add(Performance(empId, employee.name, score, month!));
          print('Performance tracked successfully!');
        } else {
          print('Employee not found.');
        }
        break;

      case '3':
        print('Enter file name to export (e.g., employees.json):');
        String? fileNameJson = stdin.readLineSync();
        await FileManager.exportToJson(employees, fileNameJson!);
        break;

      case '4':
        print('Enter file name to export (e.g., employees.txt):');
        String? fileNameTxt = stdin.readLineSync();
        await FileManager.exportToTxt(employees, fileNameTxt!);
        break;

      case '5':
        print('Enter file name to import (e.g., employees.json):');
        String? importFileName = stdin.readLineSync();
        employees = await FileManager.importFromJson(importFileName!);
        print('Employees imported successfully!');
        break;

      case '6':
        for (var employee in employees) {
          employee.displayInfo();
        }
        break;

      case '7':
        running = false;
        print('Exiting...');
        break;

      default:
        print('Invalid option. Try again.');
    }
  }
}

class Employee {
  String name;
  int id;
  String department;
  DateTime hireDate;
  int performanceScores = 0;

  Employee(this.name, this.id, this.department, this.hireDate);

  void displayInfo() {
    print(
        'Name: $name, ID: $id, Department: $department, Hire Date: $hireDate');
  }

  void addPerformanceScore(int score) {
    performanceScores += score;
  }

  void subPerformanceScore(int score) {
    performanceScores -= score;
  }

  void clearPerformanceScore() {
    performanceScores = 0;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'department': department,
        'hireDate': hireDate.toIso8601String(),
        'performanceScores': performanceScores,
      };
}

class PermanentEmployee extends Employee {
  double salary;
  List<String> benefits;

  PermanentEmployee(String name, int id, String department, DateTime hireDate,
      this.salary, this.benefits)
      : super(name, id, department, hireDate);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({'salary': salary, 'benefits': benefits});
    return json;
  }
}

class ContractEmployee extends Employee {
  DateTime contractEndDate;
  double hourlyRate;

  ContractEmployee(String name, int id, String department, DateTime hireDate,
      this.contractEndDate, this.hourlyRate)
      : super(name, id, department, hireDate);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({
      'contractEndDate': contractEndDate.toIso8601String(),
      'hourlyRate': hourlyRate
    });
    return json;
  }
}

class Performance {
  int employeeId;
  String employeeName;
  int score;
  String month;

  Performance(this.employeeId, this.employeeName, this.score, this.month);

  void displayReport() {
    print('$employeeName Monthly Report');
    print('Employee ID: $employeeId');
    print('Month: $month');
    print('Score: $score');
  }

  Map<String, dynamic> toJson() => {
        'employeeId': employeeId,
        'employeeName': employeeName,
        'score': score,
        'month': month,
      };
}

class FileManager {
  static Future<void> exportToJson(
      List<Employee> employees, String fileName) async {
    var jsonData = employees.map((e) => e.toJson()).toList();
    var file = File(fileName);
    await file.writeAsString(jsonEncode(jsonData));
    print('Data exported to $fileName');
  }

  static Future<void> exportToTxt(
      List<Employee> employees, String fileName) async {
    var content = employees
        .map((e) => '${e.name}, ID: ${e.id}, Department: ${e.department}')
        .join('\n');
    var file = File(fileName);
    await file.writeAsString(content);
    print('Data exported to $fileName');
  }

  static Future<List<Employee>> importFromJson(String fileName) async {
    var file = File(fileName);
    List<Employee> employees = [];
    if (await file.exists()) {
      var content = await file.readAsString();
      List<dynamic> jsonData = jsonDecode(content);
      for (var data in jsonData) {
        if (data.containsKey('salary')) {
          employees.add(PermanentEmployee(
            data['name'],
            data['id'],
            data['department'],
            DateTime.parse(data['hireDate']),
            data['salary'],
            List<String>.from(data['benefits']),
          ));
        } else {
          employees.add(ContractEmployee(
            data['name'],
            data['id'],
            data['department'],
            DateTime.parse(data['hireDate']),
            DateTime.parse(data['contractEndDate']),
            data['hourlyRate'],
          ));
        }
      }
    } else {
      print('File not found');
    }
    return employees;
  }
}

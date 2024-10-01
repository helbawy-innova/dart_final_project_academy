import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/domain/hr_manger.dart';
import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/domain/file_manager.dart';
import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/models/employee.dart';
import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/models/contract_employee.dart';
import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/models/department.dart';
import '/Users/ehsanashry/AndroidStudioProjects/finalproject/bin/models/permanent_employee.dart';
import 'dart:io';
void userInterface() {
  final String filename = 'employees.json';
  final FileManager fileManager = FileManager(filename,filename);
  final HRManager hrManager = HRManager(fileManager);
  int scoreToSubtract;
  while (true) {
    print('Select an action:');
    print('1. Add Employee');
    print('2. View All Employees');
    print('3. Remove Employee');
    print('4. Add Performance Score for Employee');
    print('5. Subtract Performance Score for Employee');
    print('6. Clear Employee Performance Scores');
    print('7. Calculate Salary for Employee');
    print('8. Export Monthly Report for Employee');
    print('9. Enter department name to export employees');
    print('10. Exit');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        print('Enter Employee Type (1 for Permanent, 2 for Contract):');
        String? type = stdin.readLineSync();
        print('Enter Name:');
        String? name = stdin.readLineSync();
        print('Enter Email:');
        String? email = stdin.readLineSync();
        print('Enter ID:');
        int id = int.parse(stdin.readLineSync()!);
        print('Enter Department ID:');
        int departmentId = int.parse(stdin.readLineSync()!);
        print('Enter Department Name :');
        String? namedepartment = stdin.readLineSync();
        if (type == '1') {
          print('Enter Salary:');
          double salary = double.parse(stdin.readLineSync()!);
          print('Enter Benefits (separate with commas):');
          List<String> benefits = stdin.readLineSync()!.split(',');
          print('Enter Contract End Date (yyyy-mm-dd):');
          DateTime.parse(stdin.readLineSync()!);
          hrManager.addDepartment(Department(
            departmentname:namedepartment!,
            id:departmentId, employees: [],
          )
          );
          hrManager.addEmployee(PermanentEmployee(
            name: name!,
            email: email!,
            id: id,
            departmentId: departmentId,
            hireDate: DateTime.now(),
            salary: salary,
            benefits: benefits,
          )
          );
        } else if (type == '2') {
          print('Please enter the number of hours worked:');
          double hourlyRate = double.parse(stdin.readLineSync()!);
          print('Enter Contract End Date (yyyy-mm-dd):');
          DateTime contractEndDate = DateTime.parse(stdin.readLineSync()!);
          hrManager.addDepartment(Department(
            departmentname:namedepartment!,
            id:departmentId, employees: [],
          ));
          hrManager.addEmployee(ContractEmployee(
            name: name!,
            email: email!,
            id: id,
            departmentId: departmentId,
            hireDate: DateTime.now(),
            contractEndDate: contractEndDate,
            hoursWorked: hourlyRate,
          ));
        }
        break;

      case '2':
        hrManager.displayEmployees();
        break;

      case '3':
      // Remove Employee
        print('Enter Employee ID to Remove:');
        int employeeId = int.parse(stdin.readLineSync()!);
        hrManager.deleteEmployee(employeeId);
        print('Employee removed');
        break;

      case '4':
      // Add Performance Score
        print('Enter Employee ID:');
        int empId = int.parse(stdin.readLineSync()!);
        Employee? employee = hrManager.getEmployeeById(empId);
        if (employee != null) {
          print('Enter Performance Score (1-5):');
          int score = int.parse(stdin.readLineSync()!);
          employee.addPerformanceScore(score);
          print('Performance score added');
        } else {
          print('Employee not found');
        }
        break;

      case '5':
      // Subtract Performance Score
        print('Enter Employee ID:');
        int empIdSub = int.parse(stdin.readLineSync()!);
        Employee? employeeSub = hrManager.getEmployeeById(empIdSub);
        if (employeeSub != null) {
          print('Enter Score to Subtract:');
          scoreToSubtract = int.parse(stdin.readLineSync()!);
          employeeSub.subtractPerformanceScore(scoreToSubtract);
          print('Performance score subtracted');
        } else {
          print('Employee not found');
        }
        break;

      case '6':
        print('Enter Employee ID:');
        int empIdClear = int.parse(stdin.readLineSync()!);
        Employee? employeeClear = hrManager.getEmployeeById(empIdClear);
        if (employeeClear != null) {
          employeeClear.clearPerformanceScores();
          print('Performance scores cleared');
        } else {
          print('Employee not found');
        }
        break;

      case '7':
        print('Enter Employee ID:');
        int empIdSalary = int.parse(stdin.readLineSync()!);
        Employee? employeeSalary = hrManager.getEmployeeById(empIdSalary);
        if (employeeSalary != null) {
          double salary = employeeSalary.calculateSalary();
          print('Salary for ${employeeSalary.name}: \$$salary');
        } else {
          print('Employee not found.');
        }
        break;

      case '8':
        print('Please enter the employee ID:');
        String? input = stdin.readLineSync();
        int employeeId = int.parse(input!);
        hrManager.generateMonthlyReport(employeeId);
        break;
      case '9':
        print("Enter department name to export employees:");
        String? departmentForExport = stdin.readLineSync();
        print("Enter file name to save department employees:");
        String? exportFileName = stdin.readLineSync();
        hrManager.exportEmployeesByDepartment(departmentForExport!, exportFileName!);
        break;
      case '10':
        print('Exiting');
        return;
      default:
        print('Invalid choice. Please try again');

    }
  }
}
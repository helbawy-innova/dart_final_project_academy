import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/models/department.dart';
import 'package:dart_final_project/models/employee.dart';

class HrManager {
  Map<int, Departments>? departments;
  Map<int, Employee>? employees;
  HrManager({this.departments, this.employees});

  void addEmployee(Employee employee, FileManager fileManager) {
    try {
      employees ??= {};
      if (employees!.length < 500) {
        employees![employee.id] = employee;

        if (departments == null) {
          departments ??= {};
          departments![employee.departmentId] = Departments();
          departments![employee.departmentId]!.addEmployee(employee);
        }
        fileManager.exportEmployeesToJson(
            employees!.values.toList(), 'employee.json');
        print('Employee Added Successfully');
      } else {
        throw ('Maximum number of employees reached');
      }
    } catch (e) {
      print('Employee not added because $e');
    }
  }

  void deleteEmployee(int employeeId, FileManager fileManager) {
    try {
      employees ??= {};

      //  var employee = employees![employeeId];
      employees!.remove(employeeId);
      fileManager.deleteEmployee(
        /* employees!.values.toList(), */
        employeeId,
      );
      if (departments == null) {
        departments ??= {};
        departments![employees!.values.toList()[employeeId].departmentId] =
            Departments();
        departments![employees!.values.toList()[employeeId].departmentId]!
            .removeEmployee(employees!.values.toList()[employeeId]);
      }
      fileManager.deleteEmployee(
        employeeId,
      );
      // departments![employee!.departmentId]!.removeEmployee(employee);
      print('Employee Deleted Successfully');
    } catch (e) {
      print('Employee not found because $e');
    }
  }

  Employee getEmployeeById(int employeeId) {
    return employees![employeeId]!;
  }

  void generateCompanyReport() {
    print('Company Report');
    for (var department in departments!.values) {
      department.generateDepartmentReport();
    }
  }

  List<Employee> getEmployeesByDepartmentId(int departmentId) {
    try {
      departments ??= {};
      departments![departmentId] ??= Departments();
      departments![departmentId]!.employees ??= [];
      if (departments![departmentId]!.employees!.isEmpty) {
        print('No Employees in Department $departmentId');
        return [];
      }
      print('Employees in ${departmentsNames[departmentId]} Department');
      for (var employee in departments![departmentId]!.employees!) {
        print('${employee.name}: ${employee.id}: ${employee.performanceScore}');
      }
      return departments![departmentId]!.employees!;
    } catch (e) {
      throw ('Error: $e');
    }
  }
}

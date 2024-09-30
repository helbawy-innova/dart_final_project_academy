import 'employee.dart';

class Departments {
  String? name;
  List<Employee>? employees;
  int? id;

  Departments({
    this.name,
    this.employees,
    this.id,
  });
  void addEmployee(Employee employee) {
    employees ??= [];
    employees!.add(employee);
  }

  void removeEmployee(Employee employee) {
    employees ??= [];
    employees!.remove(employee);
  }

  void generateDepartmentReport() {
    employees ??= [];
    if (employees!.isEmpty) {
      print('No Employees in this department');
      return;
    }
    print('Department Report');
    for (var employee in employees!) {
      print('Employee Name: ${employee.name}');
      print('Employee Score: ${employee.performanceScore}');
    }
  }
}

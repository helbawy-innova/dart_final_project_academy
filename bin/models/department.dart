import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/employee.dart';
class Department {
  String departmentname;
  int id;
  List<Employee> employees;
  Department({required this.departmentname,required this.id, required List<dynamic> employees}) : employees = [];
  double get averagePerformanceScore {
    double totalScore = employees.fold(0, (sum, emp) => sum + emp.averagePerformanceScore);
    return employees.isNotEmpty ? totalScore / employees.length : 0;
  }
  List<Employee> getEmployees() {
    return employees;
  }
  Map<String, dynamic> toJson() {
    return {
      'departmentname': departmentname,
      'employees': employees.map((e) => e.toJson()).toList(),
    };
  }
}
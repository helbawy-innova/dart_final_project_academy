import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/employee.dart';
class PermanentEmployee extends Employee {
  double salary;
  List<String> benefits;
  PermanentEmployee({
    required super.name,
    required super.email,
    required super.id,
    required super.departmentId,
    required super.hireDate,
    required this.salary,
    required this.benefits,
  });
  @override
  double calculateSalary() {
    return salary;
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json.addAll({
      'salary': salary,
      'benefits': benefits,
    });
    return json;
  }
}
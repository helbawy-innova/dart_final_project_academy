import 'package:dart_final_project/models/employee.dart';

class PermanentEmployee extends Employee {
  double? salary;
  List<String>? benefits;

  PermanentEmployee(
      {required this.salary,
      required this.benefits,
      required super.name,
      required super.id,
      required super.departmentId,
      required super.hireDate,
      required super.performanceScore,
      required super.email});

  PermanentEmployee.fromJson(super.json)
      : salary = json['salary'],
        benefits = json['benefits'],
        super.fromJson();

  @override
  double calculateSalary() {
    return salary!;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'departmentId': departmentId,
      'hireDate': hireDate.toIso8601String(),
      'performanceScore': performanceScore,
      'salary': salary,
      'benefits': benefits,
    };
  }
}

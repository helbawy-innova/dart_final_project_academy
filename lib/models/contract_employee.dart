import 'package:dart_final_project/models/employee.dart';

class ContractEmployee extends Employee {
  double? hourlyRate;
  double? hoursWorked;
  DateTime? contractEndDate;

  ContractEmployee(
      {required this.hourlyRate,
      required this.hoursWorked,
      required this.contractEndDate,
      required super.name,
      required super.id,
      required super.departmentId,
      required super.hireDate,
      required super.performanceScore,
      required super.email});

  void addWorkedHours(int hours) {}

  @override
  void clearPerformanceScore() {
    performanceScore = 0;
  }

  @override
  void subPerformanceScore(int score) {
    performanceScore -= score;
  }

  @override
  void addPerformanceScore(int score) {
    performanceScore += score;
  }

  @override
  void showPerformanceScore() {
    print('Performance Score: $performanceScore');
  }

  @override
  double calculateSalary() {
    print('Salary: ${hourlyRate! * hoursWorked!}');
    return hourlyRate! * hoursWorked!;
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
      'hourlyRate': hourlyRate,
      'hoursWorked': hoursWorked,
      'contractEndDate': contractEndDate!.toIso8601String(),
    };
  }
}

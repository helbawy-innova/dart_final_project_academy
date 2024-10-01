import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/employee.dart';
class ContractEmployee extends Employee {
  DateTime contractEndDate;
  double hoursWorked;
  int hourlyRate = 150;
  ContractEmployee({
    required super.name,
    required super.email,
    required super.id,
    required super.departmentId,
    required super.hireDate,
    required this.contractEndDate,
    required this.hoursWorked,
  });
  @override
  double calculateSalary() {
    return hoursWorked * hourlyRate;
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json.addAll({
      'contractEndDate': contractEndDate.toIso8601String(),
      'hourlyRate': hoursWorked,
      'hoursWorked': hourlyRate,
    });
    return json;
  }
}
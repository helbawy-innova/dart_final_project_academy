import '../models/employee/employee.dart';
import '../domain/hr_manager.dart';
void showAllEmployeeDetails() {

  if (HrManager.employeeMap.isEmpty) {
    print('No employee found.');
    return;
  }
  else{
  print("=========================> All Employee Details <=========================");

  for (Employee e in HrManager.employeeMap.values) {
    print('Name: ${e.name}');
    print('ID: ${e.employeeId}');
    print('Performance score: ${e.performanceScore}');
    print('Deprtment: ${HrManager.dpartmentMap[e.departmentid]?.name}');
    print('Salary: \$${e.calculateSalary()}');
    print('---------------------');
  }
 }
}

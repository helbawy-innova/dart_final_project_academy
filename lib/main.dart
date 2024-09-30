/* import 'package:dart_final_project/dart_final_project.dart' as dart_final_project;
 */
import 'package:dart_final_project/constants/constants.dart';
import 'package:dart_final_project/domain/file_manager.dart';
import 'package:dart_final_project/domain/hr_manager.dart';
import 'package:dart_final_project/features/choose_service/choose_service.dart';

void main(List<String> arguments) {
  //TODO: add your cli UI here
  FileManager fileManager = FileManager();
  HrManager hr = HrManager();
  while (continueService == true) {
    chooseUserService(hr, fileManager);
  }
  /* FileManager().exportEmployeesToJson([
    PermanentEmployee(
        salary: 1,
        benefits: [],
        name: 'name',
        id: 0,
        departmentId: 0,
        hireDate: DateTime.now(),
        performanceScore: 1,
        email: 'email')
  ], 'employee.json'); */

  /*  ContractEmployee employee = ContractEmployee(
      hourlyRate: 10,
      hoursWorked: 10,
      contractEndDate: DateTime.now(),
      name: 'name',
      id: 11,
      departmentId: 1,
      hireDate: DateTime.now(),
      performanceScore: 1,
      email: 'email');
  ContractEmployee employee2 = ContractEmployee(
      hourlyRate: 10,
      hoursWorked: 10,
      contractEndDate: DateTime.now(),
      name: 'aliaa',
      id: 11,
      departmentId: 2,
      hireDate: DateTime.now(),
      performanceScore: 1,
      email: 'email');
  hr.addEmployee(employee, fileManager);
  hr.addEmployee(employee2, fileManager);
  hr.getEmployeesByDepartmentId(1); */
  /* fileManager.exportEmployeesToTxt([], 'employee.json'); */

  /*  hr.addEmployee(PermanentEmployee(
      salary: 1,
      benefits: [],
      name: 'name',
      id: 0,
      departmentId: 0,
      hireDate: DateTime.now(),
      performanceScore: 1,
      email: 'email')); */

  /* fileManager.importEmployeesFromJson('employee.json').then((value) {
    print('value $value');
  }); */
}

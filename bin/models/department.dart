import 'dart:io';
import 'employee/employee.dart';
import 'dart:convert';
import '../domain/hr_manager.dart';
class Department {
  static int departmentsID=1;
  String name;
  late int objDepartmenId;
  List<Employee>employeeDepartmentList=[];

  Department(this.name,{employeeList})
  {
    objDepartmenId=departmentsID;
    HrManager.dpartmentMap.addAll({objDepartmenId:this});
    departmentsID++;
  }

   addEmployee(Employee employeeToAdd)
  {
    this.employeeDepartmentList.add(employeeToAdd);
  }
   removeEmployee(Employee employeeToRemove)
  {
    this.employeeDepartmentList.remove(employeeToRemove);
  }
  void genreateDepartmentReport()
  {
    print(
"""
==========================================================================
=====================> Report For $name Department <======================
==========================================================================
ID:$objDepartmenId
Employees:
${makeEmployeesDepartmentList()}
""");
  }

 static void exportDepartmentEmployees() {
  print(
      "What is the ID of the department you want to export its report? ${HrManager.showAvailableDepartments()} enter number ");
  int chosenDepartmentId = int.parse(stdin.readLineSync()!);
  
  Department chosenDepartment = HrManager.dpartmentMap[chosenDepartmentId]!;

  if (!HrManager.dpartmentMap.containsKey(chosenDepartmentId)) {
    print("Wrong input!\nTry again");
    return; // Exit the function if the input is invalid
  }

  print("How do you want to export the employees?\n[1] Json\n[2] Txt");
  int chosenExportType = int.parse(stdin.readLineSync()!);
  
  List<Employee> employees = chosenDepartment.employeeDepartmentList;

  if (chosenExportType == 1) {
    String jsonOutput = jsonEncode(employees.map((e) => {
      'name': e.name,
      'employeeId': e.employeeId,
      'performanceScore': e.performanceScore,
    }).toList());

  Directory directory = Directory('models/departments_data');

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

    File jsonFile = File("${directory.path}/${chosenDepartment.name}_department_employees_report.json");

    jsonFile.writeAsStringSync(jsonOutput);
    print("${chosenDepartment.name} department report exported as JSON successfully.");

  }
    else if (chosenExportType == 2) {
    String employeeData = '========================> ${chosenDepartment.name} department report <========================\n';
    
    for (Employee e in employees) {
      employeeData += '${e.name} : ${e.employeeId} : ${e.performanceScore}\n';
    }
      Directory directory = Directory('models/departments_data');

  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

    File txtFile = File("${directory.path}/${chosenDepartment.name}_department_employees_report.txt");

    txtFile.writeAsStringSync(employeeData);
    print("${chosenDepartment.name} department report exported as txt successfully.");

  
  } else {
    print("Wrong input!\nTry again");
  }
}

  String makeEmployeesDepartmentList(){
  String employeesDepartmentList="";
  for(int i=0;i<this.employeeDepartmentList.length;i++)
  {
  Employee employee=this.employeeDepartmentList[i];
  employeesDepartmentList+=employee.name;
  employeesDepartmentList+=" : ${employee.employeeId} : ${employee.performanceScore}";
  }
  return employeesDepartmentList;
}


}

import '../models/department.dart';
import '../models/employee/employee.dart';
class HrManager {
  static Map<int,Department> dpartmentMap={};
  static Map<int,Employee> employeeMap={};
  static int employeeIndex=1;
  static int departmentIndex=1;


  static void addEmployee(Employee employeeToAdd){
    employeeMap.addAll({employeeIndex:employeeToAdd});

  }

  static void deleteEmployee(int employeeId){
    employeeMap.remove(employeeId);
    HrManager.dpartmentMap[HrManager.employeeMap[employeeId]?.departmentid]?.employeeDepartmentList.removeAt(employeeId);
  }

  static Employee? getEmployeeById(int employeeId){
    return employeeMap[employeeId];
  }

  static String showAvailableDepartments(){

    String availableDepartments="";
 
    for(int i=0;i<HrManager.dpartmentMap.length;i++)
    {
      availableDepartments+="${i+1}: ${HrManager.dpartmentMap[i+1]?.name}  ";
    }

    return availableDepartments;
  }
}
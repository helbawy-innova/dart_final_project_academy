import 'package:intl/intl.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/domain/file_manager.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/employee.dart';
import '/Users/ehsanashry/AndroidStudioProjects/dart_final_project_academy/bin/models/department.dart';
class HRManager {
  Map<int, Employee> employees = {};
  Map<int, Department> departments = {};
  final FileManager fileManager;
  HRManager(this.fileManager);
  void addEmployee(Employee employee) {
    employees[employee.id] = employee;
    saveAllData();
  }
  void deleteEmployee(int employeeId) {
    employees.remove(employeeId);
    saveAllData();
  }
  Employee? getEmployeeById(int employeeId) {
    return employees[employeeId];
  }
  List<Employee> getAllEmployees() {
    return employees.values.toList();
  }
  Future<void> loadEmployees() async {
    List<Employee> loadedEmployees = await fileManager.loadEmployeesFromFile();
    for (var employee in loadedEmployees) {
      addEmployee(employee);
    }
  }

  void saveAllData() {
    List<Employee> employees = getAllEmployees();
    List<Department> departments = getAllDepartment();

    for (var department in departments) {
      department.employees = employees.where((e) => e.departmentId == department.id).toList();
    }

    fileManager.saveAllData(employees, departments);
  }
  void displayEmployees() {
    getAllEmployees();
    for (var employee in employees.values) {
      String? departmentName = departments[employee.departmentId]?.departmentname;
      print(' Name: ${employee.name}, ID: ${employee.id}, Department: ${departmentName ?? 'Unknown'}, Score: ${employee.averagePerformanceScore}, Salary: ${employee.calculateSalary()}');
    }
  }
  void addDepartment(Department department) {
    departments[department.id] = department;
    saveAllData();

  }
  List<Department> getAllDepartment() {
    return departments.values.toList();

  }
  void loadDepartment() {
    List<Department> loadedDepartment = fileManager.loadDepartmentsFromFile();
    for (var department in loadedDepartment) {
      addDepartment(department);
    }
  }
  List<Employee> getEmployeesByDepartment(String departmentName) {
    return employees.values
        .where((employee) => departments[employee.departmentId]?.departmentname == departmentName)
        .toList();
  }
  void exportEmployeesByDepartment(String departmentForExport, String fileName) {
    if (departmentForExport == "HR" || departmentForExport == "Sales" || departmentForExport == "Engineering") {

      List<Department> targetDepartments = departments.values.where(
            (department) => department.departmentname == departmentForExport,
      ).toList();

      if (targetDepartments.isNotEmpty) {
        List<Employee> allEmployees = [];

        for (var targetDepartment in targetDepartments) {
          allEmployees.addAll(targetDepartment.employees);
        }

        if (allEmployees.isEmpty) {
          print("No employees found in the $departmentForExport department.");
        } else {
          print("Employees in $departmentForExport Department:");

          for (var employee in allEmployees) {
            print("${employee.name} (ID: ${employee.id})");
          }

          fileManager.exportEmployeesToJson(allEmployees, fileName);
        }
      } else {
        print("Department not found!");
      }
    } else {
      print("Invalid department name. Please enter a valid department (HR, Sales, or Engineering).");
    }
  }

  void generateMonthlyReport(int employeeId) {
    DateTime now = DateTime.now();
    String monthName = DateFormat.MMMM().format(now);
    if (employees.containsKey(employeeId)) {
      var employee = employees[employeeId];
      print('${employee?.name} Report :,ID:${employee?.id},Current Month:$monthName,PerformanceScore:${employee?.averagePerformanceScore.toString()}');
    } else {
      print('Employee with ID $employeeId not found.');
    }
  }
}
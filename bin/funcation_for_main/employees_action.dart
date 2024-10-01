import 'dart:io';
import 'deduct_money_from_employee.dart';
import 'add_employee_form.dart';
import 'remove_employee_form.dart';
import 'edit_employee_score.dart';
import 'calculate_salary.dart';
import 'show_employee_details.dart';
import 'show_all_employee_details.dart';
import '../cli_ui.dart';
void employeesAction(){
print("\n===========================================================================\n");
print("What you want to do?\n[1]Add New Employees\n[2]Remove Employee\n[3]Add, Subtract, Clear employee score\n[4]Calculate salary\n[5]Show employee details\n[6]Show all employees details\n[7]Deduct money\n[8]Back");
int input=int.parse(stdin.readLineSync()!);
switch (input){
  case 1:
  print("\n===========================================================================\n");
  addEmployeeForm();
  case 2:
  print("\n===========================================================================\n");
  removeEmpoyeeform();
  case 3:
  print("\n===========================================================================\n");
  editEmployeeScore();
  case 4:
  print("\n===========================================================================\n");
  calculateSalary();
  case 5:
  print("\n===========================================================================\n");
  showEmployeeDetails();
  case 6:
  showAllEmployeeDetails();
  case 7:
  print("\n===========================================================================\n");
  deductMoneyFromEmployee();
  case 8:
  print("\n===========================================================================\n");
  cliUi();
  }
}
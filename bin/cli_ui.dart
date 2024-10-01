import 'dart:io';
import 'models/department.dart';
import 'funcation_for_main/employees_action.dart';
import 'funcation_for_main/report.dart';
import 'funcation_for_main/export_employee_report.dart';
void cliUi(){
  try{
print(
r"""
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║     ███████╗███╗   ███╗██████╗ ██╗      ██████╗ ██╗   ██╗███████╗███████╗ ║
║     ██╔════╝████╗ ████║██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝██╔════╝██╔════╝ ║
║     █████╗  ██╔████╔██║██████╔╝██║     ██║   ██║ ╚████╔╝ █████╗  █████╗   ║
║     ██╔══╝  ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║  ╚██╔╝  ██╔══╝  ██╔══╝   ║
║     ███████╗██║ ╚═╝ ██║██║     ███████╗╚██████╔╝   ██║   ███████╗███████╗ ║
║     ╚══════╝╚═╝     ╚═╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝ ║
║                                                                           ║
║                    🌟 MANAGEMENT SYSTEM EXTRAORDINAIRE 🌟                 ║
║                                                                           ║
╠═══════════════════════════════════════════════════════════════════════════╣
║                                                                           ║
║  [1] 🚀 Employees action                                                  ║
║  [2] 📊 Export employee monthly report                                    ║
║  [3] 🏢 Export Department Employees                                       ║
║  [4] 📈 Report                                                            ║
║  [5] 🚪 Exit                                                              ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
""");
int chosenAction=int.parse(stdin.readLineSync()!);
switch (chosenAction){
  case 1:
  employeesAction();
  case 2:
  exportEmployeeMonthlyReport();
  case 3:
  Department.exportDepartmentEmployees();
  case 4:
  report();
  case 5:

  print(r"""
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║   ████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗    ██╗   ██╗ ██████╗ ██╗   ██╗
║   ╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║
║      ██║   ███████║███████║██╔██╗ ██║█████╔╝      ╚████╔╝ ██║   ██║██║   ██║
║      ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗       ╚██╔╝  ██║   ██║██║   ██║
║      ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝
║      ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ 
║                                                                           ║
║                   🎉 FOR USING OUR AWESOME SYSTEM! 🎉                     ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
"""); return;
  

  default:print("❌ Oops! Wrong input. Let's try that again, shall we? 🔄\n");
  cliUi();
  }
  print("\n\n\n\n");
  cliUi();}
  catch(e){

    print("❌ Uh-oh! Something went wrong. Let's give it another shot! 🔄\n");
    cliUi();}
  }
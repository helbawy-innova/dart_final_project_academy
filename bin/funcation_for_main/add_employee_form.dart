import 'dart:io';
import '../models/employee/permenant_employee.dart';
import '../models/employee/contract_employee.dart';
import '../domain/hr_manager.dart';
List<String>chosenBenfitsList=[];

 void addEmployeeForm()
{
  try{
  print("[1]Contract Employee\n[2]Permenant Employee\n");
  int chosenEmployeeType=int.parse(stdin.readLineSync()!);
  
  print("\n===========================================================================\n");
  print("Which department the employee will work on?\n${HrManager.showAvailableDepartments()}\nEnter number")  ;
  int chosenDepartmentId=int.parse(stdin.readLineSync()!);

  print("\n===========================================================================\n");
  print("What name of the employee");
  String chosenName=stdin.readLineSync()!;

  print("\n===========================================================================\n");
  print("What email of the employee");
  String chosenEmail=stdin.readLineSync()!;

  if(chosenEmployeeType==1){
  print("\n===========================================================================\n");
  print("What hours rate of the employee");
  double chosenHoursRate=double.parse(stdin.readLineSync()!);

  print("\n===========================================================================\n");
  print("What contracte end date of the employee (MM-DD-YYYY) ex(2024-09-27)");
  DateTime chosenContracteEndDate=DateTime.parse(stdin.readLineSync()!);

  print("\n===========================================================================\n");
  print("How much hours he worked?");
  double chosenHoursWorked=double.parse(stdin.readLineSync()!);
  
  ContractEmployee(chosenName,chosenEmail,chosenDepartmentId,chosenHoursRate,chosenContracteEndDate,hoursWorked: chosenHoursWorked);
  return;
  }

  else{
  print("\n===========================================================================\n");
  print("What salary of the employee");
  double chosensSalary=double.parse(stdin.readLineSync()!);

  askForBenefits();
  PermenantEmployee(chosenName,chosenEmail,chosenDepartmentId,chosenBenfitsList,chosensSalary);
  return;
  }
  }
  catch(e){
    print("Wrong Input!\n Try again");
    addEmployeeForm();
  }
  
}

void askForBenefits(){
  print("Do you want to add benefits to the employee?\n[1]Yes\n[2]No");
  int chosensnumber=int.parse(stdin.readLineSync()!);
  bool invalidInput=false;
 do
  {
    if(chosensnumber==1){
      invalidInput=false;
      addBenefits();
    }

    else if(chosensnumber==2){invalidInput=false;
      break;
    }
    
    else{
      print("Enter valid number please");
      invalidInput=true;
    }
  }
  while(invalidInput); 

}
void addBenefits(){
      print("\n===========================================================================\n");
      print("What benfits you want to add to the employee (Write one)");
      String chosenBenfit=stdin.readLineSync()!;
      chosenBenfitsList.add(chosenBenfit);
      print("\n===========================================================================\n");
      print("Do you want to add more benefits to the employee?\n[1]Yes\n[2]No");
      int chosensnumber=int.parse(stdin.readLineSync()!);
          
    if(chosensnumber==1){
    addBenefits();
    }
}

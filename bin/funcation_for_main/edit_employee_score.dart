import 'dart:io';
import '../domain/hr_manager.dart';
import '../models/employee/employee.dart';

void editEmployeeScore() {
  print("What the employee ID?");
  int chosenEmployeeId = int.parse(stdin.readLineSync()!);

  Employee? chosenEmployee = HrManager.getEmployeeById(chosenEmployeeId);

  if (HrManager.employeeMap.containsKey(chosenEmployeeId)) {
    print(
        "Do you want to edit general performance or specific month?\n[1]General\n[2]Sespecific month\n");
    int chosenTypeOfEdit = int.parse(stdin.readLineSync()!);
    if (chosenTypeOfEdit == 1) {
      print(
          "What you want to do in performance score?\n[1]Add\n[2]Subtract\n[3]Clear\n");
      int chosenAction = int.parse(stdin.readLineSync()!);
      switch (chosenAction) {
        case 1:
          print("How much you want to add?\n");
          int chosenAdd = int.parse(stdin.readLineSync()!);
          HrManager.getEmployeeById(chosenEmployeeId)
              ?.addPerformanceScore(chosenAdd);
          print("Done");
          break;

        case 2:
          print("How much you want to subtract?\n");
          int chosenSup = int.parse(stdin.readLineSync()!);
          HrManager.getEmployeeById(chosenEmployeeId)
              ?.supPerformanceScore(chosenSup);
          print("Done");
          break;

        case 3:
          HrManager.getEmployeeById(chosenEmployeeId)?.clearPerformanceScore();
          print("Done");
          break;
      }
    } else if (chosenTypeOfEdit == 2) {
      print(
          "What month you want to edit?\n[1]January\n[2]February\n[3]March\n[4]April\n[5]May\n[6]June\n[7]July\n[8]August\n[9]September\n[10]October\n[11]November\n[12]December\n");
      int chosenMonth = int.parse(stdin.readLineSync()!);
      int? currentValue = chosenEmployee?.monthPerformanceScore[chosenMonth];
      print(
          "What you want to do in performance score?\n[1]Add\n[2]Subtract\n[3]Clear\nThe current value is $currentValue\n");
      int chosenAction = int.parse(stdin.readLineSync()!);
      switch (chosenAction) {
        case 1:
          print("How much you want to add?\n");
          int chosenAdd = int.parse(stdin.readLineSync()!);
          int newValue = currentValue! + chosenAdd;
          if (newValue > 5) {
            newValue = 5;
          } else if (newValue < 0) {
            newValue = 0;
          }
          chosenEmployee?.monthPerformanceScore[chosenMonth] = newValue;
          print("Done");
          break;
        case 2:
          print("How much you want to subtract?\n");
          int chosenSubtract = int.parse(stdin.readLineSync()!);
          int newValueSubtract = currentValue! - chosenSubtract;
          if (newValueSubtract > 5) {
            newValueSubtract = 5;
          } else if (newValueSubtract < 0) {
            newValueSubtract = 0;
          }
          chosenEmployee?.monthPerformanceScore[chosenMonth] = newValueSubtract;
          print("Done");

          break;

        case 3:
          chosenEmployee?.monthPerformanceScore[chosenMonth] =
              0; // Clear the score
          print("Performance score cleared for month $chosenMonth.");

          break;
      }
    } else {
      print("Wrong input \nTry again");
      editEmployeeScore();
    }
  }
  else {
    print("Thare is no employee with that id! \nTry again");
    editEmployeeScore();
  }
}
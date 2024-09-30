class Employee {
  String name;
  String email;
  int id;
  int departmentId;
  DateTime hireDate;
  int performanceScore;

  Employee(
      {required this.name,
      required this.id,
      required this.departmentId,
      required this.hireDate,
      required this.performanceScore,
      required this.email});
  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        id = json['id'],
        departmentId = json['departmentId'],
        hireDate = DateTime.parse(json['hireDate']),
        performanceScore = json['performanceScore'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'departmentId': departmentId,
      'hireDate': hireDate.toIso8601String(),
      'performanceScore': performanceScore,
    };
  }

  void showEmployeeInfo() {
    print('Employee Name: $name');
    print('Employee ID: $id');
    print('Department ID: $departmentId');
    print('Hire Date: $hireDate');
    print('Performance Score: $performanceScore');
  }

  void clearPerformanceScore() {
    performanceScore = 0;
  }

  void subPerformanceScore(int score) {
    try {
      if (performanceScore - score < 0) {
        performanceScore = 0;
      } else {
        performanceScore -= score;
        print('Performance Score: $performanceScore');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void addPerformanceScore(int score) {
    try {
      if (performanceScore + score > 5) {
        performanceScore = 5;
        
      } else {
        performanceScore += score;
        print('Performance Score: $performanceScore');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void showPerformanceScore() {
    print('Monthly Performance report');
    print('Employee Name: $name');
    print('Employee ID: $id');
    print('Month date:${DateTime.now().month}');
    print('Performance Score: $performanceScore');
  }

  double calculateSalary() {
    return 0;
  }
}

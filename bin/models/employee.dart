abstract class Employee {
  String name;
  String email;
  int id;
  int departmentId;
  DateTime hireDate;
  List<int> performanceScores = [];
  Employee({
    required this.name,
    required this.email,
    required this.id,
    required this.departmentId,
    required this.hireDate,
  });
  void addPerformanceScore(int score) {
    performanceScores.add(score);
  }
  void subtractPerformanceScore(int scoreToSubtract) {
    if (performanceScores.isNotEmpty) {
      int lastScore = performanceScores.last;
      lastScore -= scoreToSubtract;
      if (lastScore < 0) lastScore = 0;
      performanceScores[performanceScores.length - 1] = lastScore;
    } else {
      print('No performance scores to subtract from.');
    }
  }
  void clearPerformanceScores() {
    performanceScores.clear();
  }
  double get averagePerformanceScore {
    if (performanceScores.isEmpty) {
      return 0.0;
    }
    return performanceScores.reduce((a, b) => a + b) / performanceScores.length;
  }
  double calculateSalary();

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'departmentId': departmentId,
      'hireDate': hireDate.toIso8601String(),
      'performanceScores': performanceScores,
      'averagePerformanceScore': averagePerformanceScore,
    };
  }

}

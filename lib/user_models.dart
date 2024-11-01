class User {
  final String id;
  final String name;
  final String role; // 'student' or 'instructor'

  User({required this.id, required this.name, required this.role});
}

class Student extends User {
  double totalHoursDriven;
  double nightHoursDriven;
  List<String> quizScores;

  Student({
    required String id,
    required String name,
    required this.totalHoursDriven,
    required this.nightHoursDriven,
    required this.quizScores,
  }) : super(id: id, name: name, role: 'student');
}

class Instructor extends User {
  Instructor({required String id, required String name})
      : super(id: id, name: name, role: 'instructor');

  // Function to view all students' progress
  List<Student> viewAllStudents(List<Student> students) {
    return students;
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'user_models.dart';

class UserPreferences {
  static Future<void> saveStudentData(Student student) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('${student.id}_totalHoursDriven', student.totalHoursDriven);
    prefs.setDouble('${student.id}_nightHoursDriven', student.nightHoursDriven);
    prefs.setStringList('${student.id}_quizScores', student.quizScores);
  }

  static Future<Student?> loadStudentData(String studentId, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? totalHoursDriven = prefs.getDouble('${studentId}_totalHoursDriven');
    double? nightHoursDriven = prefs.getDouble('${studentId}_nightHoursDriven');
    List<String>? quizScores = prefs.getStringList('${studentId}_quizScores');

    if (totalHoursDriven != null && nightHoursDriven != null && quizScores != null) {
      return Student(
        id: studentId,
        name: name,
        totalHoursDriven: totalHoursDriven,
        nightHoursDriven: nightHoursDriven,
        quizScores: quizScores,
      );
    }
    return null; // If no data is found, return null
  }
}

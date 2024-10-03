import 'package:flutter/material.dart';
import '../user_models.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

class StudentDashboard extends StatelessWidget {
  final Student student;

  StudentDashboard({required this.student});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Student Dashboard',
      appBar: AppBar(
        title: Text('My Progress - ${student.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total Hours Driven: ${student.totalHoursDriven}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Night Hours Driven: ${student.nightHoursDriven}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Quiz Scores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: student.quizScores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Quiz ${index + 1}: ${student.quizScores[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

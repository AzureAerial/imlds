import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';
import 'login_screen.dart';
import 'package:intl/intl.dart'; // For formatting timestamps

class TeacherDashboard extends StatefulWidget {
  final String uid;

  TeacherDashboard({required this.uid});

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Teacher Dashboard',
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final students = snapshot.data?.docs ?? [];

                  if (students.isEmpty) {
                    return Center(child: Text('No students found.'));
                  }

                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final studentData = students[index].data() as Map<String, dynamic>;
                      final studentName = studentData['name'] ?? 'Unknown';
                      final totalHours = studentData.containsKey('totalHours')
                          ? studentData['totalHours'].toDouble()
                          : 0.0;
                      final nightHours = studentData.containsKey('nightHours')
                          ? studentData['nightHours'].toDouble()
                          : 0.0;
                      final studentId = students[index].id;

                      return ExpansionTile(
                        title: Text(studentName),
                        subtitle: Text(
                          'Total Hours: ${totalHours.toStringAsFixed(2)}h | Night Hours: ${nightHours.toStringAsFixed(2)}h',
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Driving Time',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                    'Total Driving Hours: ${totalHours.toStringAsFixed(2)} / 60'),
                                LinearProgressIndicator(
                                  value: totalHours / 60,
                                  backgroundColor: Colors.grey[200],
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 10),
                                Text(
                                    'Night Driving Hours: ${nightHours.toStringAsFixed(2)} / 10'),
                                LinearProgressIndicator(
                                  value: nightHours / 10,
                                  backgroundColor: Colors.grey[200],
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Quiz Scores (Goal: 70% or above)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                StreamBuilder<QuerySnapshot>(
                                  stream: _usersCollection
                                      .doc(studentId)
                                      .collection('quizScores')
                                      .orderBy('timestamp', descending: true)
                                      .snapshots(),
                                  builder: (context, quizSnapshot) {
                                    if (quizSnapshot.hasError) {
                                      return Text('Error loading quiz scores');
                                    }

                                    if (quizSnapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }

                                    final quizScores = quizSnapshot.data?.docs ?? [];

                                    if (quizScores.isEmpty) {
                                      return Text('No quiz scores available.');
                                    }

                                    return Column(
                                      children: quizScores.map((quiz) {
                                        final quizData = quiz.data() as Map<String, dynamic>;
                                        final score = quizData['score']?.toDouble() ?? 0.0;
                                        final totalQuestions = quizData['totalQuestions']?.toInt() ?? 1;
                                        final percentage = (score / totalQuestions) * 100;
                                        final timestamp = quizData['timestamp'] as Timestamp?;
                                        final formattedDate = timestamp != null
                                            ? DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate())
                                            : 'N/A';

                                        return ListTile(
                                          title: Text(
                                            '${quizData['quizTitle']}: ${percentage.toStringAsFixed(1)}%',
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Taken on: $formattedDate'),
                                              percentage >= 70
                                                  ? Text('Goal Met', style: TextStyle(color: Colors.green))
                                                  : Text('Goal Not Met', style: TextStyle(color: Colors.red)),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'External Practice Test Scores (Goal: 70% or above):',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                StreamBuilder<QuerySnapshot>(
                                  stream: _usersCollection
                                      .doc(studentId)
                                      .collection('externalScores')
                                      .orderBy('timestamp', descending: true)
                                      .snapshots(),
                                  builder: (context, practiceScoreSnapshot) {
                                    if (practiceScoreSnapshot.hasError) {
                                      return Text('Error loading external practice test scores');
                                    }

                                    if (practiceScoreSnapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }

                                    final practiceScores = practiceScoreSnapshot.data?.docs ?? [];

                                    if (practiceScores.isEmpty) {
                                      return Text('No external practice test scores available.');
                                    }

                                    return Column(
                                      children: practiceScores.map((test) {
                                        final testData = test.data() as Map<String, dynamic>;
                                        final score = testData['score']?.toDouble() ?? 0.0;
                                        final percentage = score;
                                        final timestamp = testData['timestamp'] as Timestamp;
                                        final formattedDate =
                                            DateFormat('yyyy-MM-dd HH:mm').format(timestamp.toDate());

                                        return ListTile(
                                          title: Text('Score: ${percentage.toStringAsFixed(1)}%'),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Taken on: $formattedDate'),
                                              percentage >= 70
                                                  ? Text('Goal Met', style: TextStyle(color: Colors.green))
                                                  : Text('Goal Not Met', style: TextStyle(color: Colors.red)),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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

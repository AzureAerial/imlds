import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'flashcards_screen.dart'; // Import the flashcards screen
import 'driving_rules_screen.dart'; // Import the driving rules screen
import '../questions.dart'; // Import your questions
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firebase
import 'package:in_my_lane/widgets/background_scaffold.dart';

class StudyMaterialsScreen extends StatelessWidget {
  final String uid; // Make sure to pass UID here

  StudyMaterialsScreen({required this.uid}); // Constructor with uid

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Study Materials',
      appBar: AppBar(
        title: Text('Study Materials'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quizTitle: 'General Knowledge Quiz',
                        questions: generalQuestions,
                        uid: uid, // Pass uid here
                      ),
                    ),
                  );
                },
                child: Text('General Knowledge Quiz'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quizTitle: 'Road Signs Quiz',
                        questions: roadSignsQuestions,
                        uid: uid, // Pass uid here
                      ),
                    ),
                  );
                },
                child: Text('Road Signs Quiz'),
              ),
              SizedBox(height: 20),
              // New Quiz Buttons for Quiz 1, Quiz 2, and Quiz 3
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quizTitle: 'Quiz 1',
                        questions: quiz1,
                        uid: uid,
                      ),
                    ),
                  );
                },
                child: Text('Quiz 1'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quizTitle: 'Quiz 2',
                        questions: quiz2,
                        uid: uid,
                      ),
                    ),
                  );
                },
                child: Text('Quiz 2'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quizTitle: 'Quiz 3',
                        questions: quiz3,
                        uid: uid,
                      ),
                    ),
                  );
                },
                child: Text('Quiz 3'),
              ),
              SizedBox(height: 20), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlashcardsScreen(), // Flashcards, no uid needed
                    ),
                  );
                },
                child: Text('Flashcards'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrivingRulesScreen(), // Driving Rules, no uid needed
                    ),
                  );
                },
                child: Text('Driving Rules'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchURL, // External link button
                child: Text('External Practice Test'),
              ),
              SizedBox(height: 20), // Space for the new button
              ElevatedButton(
                onPressed: () {
                  _showScoreEntryDialog(context); // Function to show the dialog
                },
                child: Text('Submit External Test Score'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch the external URL
  void _launchURL() async {
    const url = 'https://driver-start.com/michigan/mi-driver-permit-test.html#/STARTPRACTICETEST';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to show a dialog for submitting the test score
  void _showScoreEntryDialog(BuildContext context) {
    TextEditingController _scoreController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter External Test Score'),
          content: TextField(
            controller: _scoreController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter your score as percentage'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String score = _scoreController.text.trim();
                if (score.isNotEmpty) {
                  await _submitExternalScore(double.parse(score)); // Submit the score
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Score submitted!')));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  // Function to submit the external practice test score to Firestore
  Future<void> _submitExternalScore(double score) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('users').doc(uid).collection('externalScores').add({
        'score': score,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error submitting external score: $e');
    }
  }
}

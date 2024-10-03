import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:in_my_lane/widgets/background_scaffold.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Map<String, Object>> questions;
  final String uid; // Receive uid

  QuizScreen({required this.quizTitle, required this.questions, required this.uid});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String> _scoreHistory = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance

  @override
  void initState() {
    super.initState();
    _loadScoreHistory();
  }

  void _loadScoreHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _scoreHistory = prefs.getStringList('${widget.quizTitle}_scoreHistory') ?? [];
    });
  }

  Future<void> _saveScoreToFirebase(int score) async {
    try {
      await _firestore.collection('users').doc(widget.uid).collection('quizScores').add({
        'quizTitle': widget.quizTitle,
        'score': score,
        'totalQuestions': widget.questions.length,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quiz score saved to Firebase!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save score to Firebase: ${e.toString()}')),
      );
    }
  }

  void _saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _scoreHistory.add('Score: $score/${widget.questions.length}');
    await prefs.setStringList('${widget.quizTitle}_scoreHistory', _scoreHistory);

    // Also save the score to Firebase
    await _saveScoreToFirebase(score);
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= widget.questions.length) {
      _saveScore(_score);
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Quiz Screen',
      appBar: AppBar(
        title: Text(widget.quizTitle),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_currentQuestionIndex < widget.questions.length)
                ...[
                  Text(
                    widget.questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  // Display image if available
                  if (widget.questions[_currentQuestionIndex].containsKey('image'))
                    Image.asset(
                      widget.questions[_currentQuestionIndex]['image'] as String,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.contain, // Ensures the image maintains aspect ratio
                    ),
                  SizedBox(height: 20),

                  ...(widget.questions[_currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer['score'] as int),
                        child: Text(answer['text'] as String),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                    );
                  }).toList(),
                ]
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You scored $_score/${widget.questions.length}',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _restartQuiz,
                      child: Text('Restart Quiz'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

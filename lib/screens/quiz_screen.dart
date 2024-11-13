import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Map<String, Object>> questions;
  final String uid;

  QuizScreen({required this.quizTitle, required this.questions, required this.uid});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String> _scoreHistory = [];
  List<Map<String, dynamic>> _incorrectAnswers = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

    await _saveScoreToFirebase(score);
  }

  void _answerQuestion(int score, String selectedAnswer) {
    final question = widget.questions[_currentQuestionIndex];
    setState(() {
      _score += score;
      if (score == 0) {
        String correctAnswer = (question['answers'] as List<Map<String, Object>>)
            .firstWhere((answer) => answer['score'] == 1)['text'] as String;
        _incorrectAnswers.add({
          'question': question['question'],
          'selectedAnswer': selectedAnswer,
          'correctAnswer': correctAnswer,
        });
      }
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
      _incorrectAnswers.clear();
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
          child: _currentQuestionIndex < widget.questions.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.questions[_currentQuestionIndex]['question'] as String,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    if (widget.questions[_currentQuestionIndex].containsKey('image'))
                      Image.asset(
                        widget.questions[_currentQuestionIndex]['image'] as String,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    SizedBox(height: 20),
                    ...(widget.questions[_currentQuestionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => _answerQuestion(answer['score'] as int, answer['text'] as String),
                          child: Text(answer['text'] as String),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'You scored $_score/${widget.questions.length}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      if (_incorrectAnswers.isNotEmpty) ...[
                        Text(
                          'Review Incorrect Answers:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _incorrectAnswers.length,
                          itemBuilder: (context, index) {
                            final incorrect = _incorrectAnswers[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Colors.grey[200], // Light card background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5, // Slight shadow for contrast
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Question:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      incorrect['question'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Your Answer:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      incorrect['selectedAnswer'],
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Correct Answer:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      incorrect['correctAnswer'],
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _restartQuiz,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text(
                          'Restart Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

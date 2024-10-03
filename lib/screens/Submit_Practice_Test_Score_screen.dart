import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/background_scaffold.dart';

class SubmitPracticeTestScoreScreen extends StatefulWidget {
  final String uid;

  SubmitPracticeTestScoreScreen({required this.uid});

  @override
  _SubmitPracticeTestScoreScreenState createState() => _SubmitPracticeTestScoreScreenState();
}

class _SubmitPracticeTestScoreScreenState extends State<SubmitPracticeTestScoreScreen> {
  final TextEditingController _scoreController = TextEditingController();

  void _submitScore() async {
    try {
      final double score = double.parse(_scoreController.text);
      final timestamp = Timestamp.now();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection('externalPracticeScores')
          .add({
        'score': score,
        'timestamp': timestamp,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Score submitted successfully!')),
      );

      Navigator.pop(context); // Go back after submission
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit score: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
       title: 'Submit Score',
      appBar: AppBar(
        title: Text('Submit External Practice Test Score'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _scoreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your score',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitScore,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

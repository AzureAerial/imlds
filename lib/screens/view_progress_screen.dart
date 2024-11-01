import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_my_lane/widgets/background_scaffold.dart';

class ViewProgressScreen extends StatefulWidget {
  final String uid; // Accept uid as a parameter

  ViewProgressScreen({required this.uid}); // Constructor for uid

  @override
  _ViewProgressScreenState createState() => _ViewProgressScreenState();
}

class _ViewProgressScreenState extends State<ViewProgressScreen> {
  double totalHours = 0.0;
  double nightHours = 0.0;
  List<Map<String, dynamic>> quizScores = [];
  List<Map<String, dynamic>> externalScores = []; // Updated variable name

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  void _loadProgress() async {
    try {
      // Fetch user-specific progress data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          totalHours = (userDoc['totalHours'] ?? 0.0).toDouble();
          nightHours = (userDoc['nightHours'] ?? 0.0).toDouble();
        });
      }

      // Fetch quiz scores from Firestore
      QuerySnapshot quizScoreDocs = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection('quizScores')
          .get();

      setState(() {
        quizScores = quizScoreDocs.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            'quizTitle': data['quizTitle'] ?? 'Untitled Quiz',
            'score': (data['score'] ?? 0).toDouble(), // Ensure it's double
            'totalQuestions': data['totalQuestions'] ?? 1,
            'timestamp': data['timestamp'] != null
                ? (data['timestamp'] as Timestamp).toDate()
                : null,
          };
        }).toList();
      });

      // Fetch external practice test scores from Firestore
      QuerySnapshot externalScoreDocs = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection('externalScores') // Updated collection name
          .get();

      setState(() {
        externalScores = externalScoreDocs.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            'score': (data['score'] ?? 0).toDouble(), // Ensure it's double
            'timestamp': data['timestamp'] != null
                ? (data['timestamp'] as Timestamp).toDate()
                : null,
          };
        }).toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading progress: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'View Progress',
      appBar: AppBar(
        title: Text('My Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the entire screen content
        child: SingleChildScrollView( // Added to prevent overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Display total driving hours with a goal of 60 hours
              Text(
                'Total Driving Hours: ${totalHours.toStringAsFixed(2)} / 60',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: (totalHours / 60).clamp(0.0, 1.0), // Goal: 60 hours
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ),

              // Display night driving hours with a goal of 10 hours
              SizedBox(height: 20),
              Text(
                'Night Driving Hours: ${nightHours.toStringAsFixed(2)} / 10',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: (nightHours / 10).clamp(0.0, 1.0), // Goal: 10 hours
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ),

              // Spacer
              SizedBox(height: 30),

              // Display quiz scores with a 70% goal
              Text(
                'Quiz Scores (Goal: 70% or above):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              quizScores.isEmpty
                  ? Text('No quiz scores available.')
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: quizScores.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> quiz = quizScores[index];
                        double score = quiz['score'] ?? 0.0;
                        int totalQuestions = quiz['totalQuestions'] ?? 1;
                        double percentage = (score / totalQuestions) * 100;
                        DateTime? timestamp = quiz['timestamp'];

                        return ListTile(
                          title: Text(
                              '${quiz['quizTitle']}: ${percentage.toStringAsFixed(1)}%'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              percentage >= 70
                                  ? Text('Goal Met!',
                                      style: TextStyle(color: Colors.green))
                                  : Text('Goal Not Met',
                                      style: TextStyle(color: Colors.red)),
                              timestamp != null
                                  ? Text('Taken on: ${timestamp.toLocal()}')
                                  : SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),

              // Spacer
              SizedBox(height: 30),

              // Display external practice test scores with a 70% goal
              Text(
                'External Practice Test Scores (Goal: 70% or above):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              externalScores.isEmpty
                  ? Text('No external practice test scores available.')
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: externalScores.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> test = externalScores[index];
                        double score = test['score'] ?? 0.0;
                        double percentage = score; // Assuming score is already a percentage
                        DateTime? timestamp = test['timestamp'];

                        return ListTile(
                          title: Text('Score: ${percentage.toStringAsFixed(1)}%'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              percentage >= 70
                                  ? Text('Goal Met!',
                                      style: TextStyle(color: Colors.green))
                                  : Text('Goal Not Met',
                                      style: TextStyle(color: Colors.red)),
                              timestamp != null
                                  ? Text('Taken on: ${timestamp.toLocal()}')
                                  : SizedBox(),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

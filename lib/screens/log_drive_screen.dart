import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore for online storage
import '../widgets/background_scaffold.dart';

class LogDriveScreen extends StatefulWidget {
  final String uid; // Accept uid as a parameter

  LogDriveScreen({required this.uid});

  @override
  _LogDriveScreenState createState() => _LogDriveScreenState();
}

class _LogDriveScreenState extends State<LogDriveScreen> {
  Timer? _timer;
  int _start = 0;
  bool isDriving = false;
  bool isNightDrive = false;
  List<String> driveSessions = [];
  double totalHours = 0.0;
  double nightHours = 0.0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  void startTimer() {
    _start = 0; // Reset the timer for a new session
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  void stopTimer() async {
    if (_timer != null) {
      _timer!.cancel();
      double sessionHours = _start / 3600;
      String session = 'Drive: ${sessionHours.toStringAsFixed(2)}h (${isNightDrive ? "Night" : "Day"})';

      setState(() {
        driveSessions.add(session);
        totalHours += sessionHours;
        if (isNightDrive) {
          nightHours += sessionHours;
        }
      });

      // Save the session to Firestore
      await _firestore.collection('users').doc(widget.uid).set({
        'driveSessions': FieldValue.arrayUnion([session]),
        'totalHours': totalHours,
        'nightHours': nightHours,
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Drive time saved online!'),
      ));
    }
  }

  void _loadSessions() async {
    // Load data from Firestore
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(widget.uid).get();

    if (userDoc.exists) {
      setState(() {
        driveSessions = List<String>.from(userDoc.get('driveSessions') ?? []);
        totalHours = userDoc.get('totalHours')?.toDouble() ?? 0.0;
        nightHours = userDoc.get('nightHours')?.toDouble() ?? 0.0;
      });
    }
  }

  void _showManualEntryDialog() {
    double enteredTime = 0.0;
    bool isNight = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Manually Enter Drive Time'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enter time (hours)'),
                    onChanged: (value) {
                      enteredTime = double.tryParse(value) ?? 0.0;
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isNight,
                        onChanged: (value) {
                          setState(() {
                            isNight = value ?? false;
                          });
                        },
                      ),
                      Text('Night Drive'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (enteredTime > 0) {
                      _addManualTime(enteredTime, isNight);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Add Time'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addManualTime(double hours, bool isNight) async {
    String session = 'Drive: ${hours.toStringAsFixed(2)}h (${isNight ? "Night" : "Day"})';

    setState(() {
      driveSessions.add(session);
      totalHours += hours;
      if (isNight) {
        nightHours += hours;
      }
    });

    // Save the session to Firestore
    await _firestore.collection('users').doc(widget.uid).set({
      'driveSessions': FieldValue.arrayUnion([session]),
      'totalHours': totalHours,
      'nightHours': nightHours,
    }, SetOptions(merge: true));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Manual time added and saved online!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Log Drive Time',
      appBar: AppBar(
        title: const Text('Log Drive Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please keep the app open while driving to save your progress.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red, // Reminder text in red
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Space after reminder
            Text(
              'Time: ${_start ~/ 3600}:${(_start % 3600) ~/ 60}:${_start % 60}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isDriving ? null : () {
                setState(() {
                  isDriving = true;
                  isNightDrive = false;
                });
                startTimer();
              },
              child: const Text('Start Day Drive'),
            ),
            const SizedBox(height: 10), // Padding between buttons
            ElevatedButton(
              onPressed: isDriving ? null : () {
                setState(() {
                  isDriving = true;
                  isNightDrive = true;
                });
                startTimer();
              },
              child: const Text('Start Night Drive'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !isDriving ? null : () {
                setState(() {
                  isDriving = false;
                });
                stopTimer();
              },
              child: const Text('Stop Drive'),
            ),
            const SizedBox(height: 20), // Padding before the manual entry button
            ElevatedButton(
              onPressed: () {
                _showManualEntryDialog(); // Open manual entry dialog
              },
              child: const Text('Manually Enter Time'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Drive Sessions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: driveSessions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(driveSessions[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Total Hours: ${totalHours.toStringAsFixed(2)}/60'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LinearProgressIndicator(
                value: totalHours / 60,
              ),
            ),
            const SizedBox(height: 10),
            Text('Night Hours: ${nightHours.toStringAsFixed(2)}/10'),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
              child: LinearProgressIndicator(
                value: nightHours / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

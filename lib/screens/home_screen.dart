import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth for logout
import 'log_drive_screen.dart';
import 'study_materials_screen.dart';
import 'view_progress_screen.dart';
import 'login_screen.dart'; // Import the Login Screen
import '../widgets/background_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final String uid; // Declare a variable to store the user's UID

  // Modify the constructor to accept a `uid` parameter
  HomeScreen({required this.uid});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'In My Lane',
      appBar: AppBar(
        title: Text('In My Lane'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context); // Call the logout function
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logolady.png',  // Your image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogDriveScreen(uid: uid)),
                );
              },
              child: Text('Log Drive Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudyMaterialsScreen(uid: uid)),
                );
              },
              child: Text('Study Materials'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProgressScreen(uid: uid)),
                );
              },
              child: Text('View My Progress'),
            ),
          ],
        ),
      ),
    );
  }

  // Logout function
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); // Sign the user out of Firebase
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate back to login screen
    );
  }
}

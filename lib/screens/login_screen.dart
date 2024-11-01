import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'teacher_dashboard.dart'; // Import the TeacherDashboard
import 'register_screen.dart'; // Import the RegisterScreen
import '../widgets/background_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../main.dart';  // Import the file where adminEmails is declared

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _login() async {
    try {
      // Sign in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Get the user's UID
      String uid = userCredential.user?.uid ?? '';

      // Fetch the user-specific data in Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        // Cast the data to Map<String, dynamic>
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        // Check if the 'role' field exists
        String role = userData.containsKey('role') ? userData['role'] : 'student';

        // If role is not admin, fallback to checking if email is in the adminEmails list
        if (role == 'admin' || adminEmails.contains(userCredential.user?.email ?? '')) {
          // Navigate to admin dashboard
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TeacherDashboard(uid: uid)),
          );
        } else {
          // Navigate to the student's home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(uid: uid)),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not found in Firestore.')),
        );
      }
    } catch (e) {
      // Display login error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Login',
      appBar: AppBar(
        title: Text('In My Lane'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logolady.png', // Ensure this matches your file path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                if (_emailController.text.isNotEmpty) {
                  try {
                    await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password reset email sent.')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to send reset email: ${e.toString()}')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter your email to reset the password.')),
                  );
                }
              },
              child: Text('Forgot Password?'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Register'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                side: BorderSide(color: const Color.fromARGB(255, 247, 255, 96)), // Different border color
                textStyle: Theme.of(context).textTheme.labelLarge, // Apply the global labelLarge style
              ),
            ),
          ],
        ),
      ),
    );
  }
}

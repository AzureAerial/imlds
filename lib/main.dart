import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Import the generated file
import 'screens/login_screen.dart';

// constants.dart
const List<String> adminEmails = ['missjones@inmylaneds.com'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Use the generated options
  
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In My Lane',
      theme: ThemeData(
        
        // Adding global text theme for the app
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          labelLarge: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    bodyLarge: TextStyle(color: Colors.white, fontSize: 18.0),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18.0),
          headlineLarge: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)
        ),
      ),
      home: LoginScreen(),
    );
  }
}

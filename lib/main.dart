import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter25/notes/notes_login_screen.dart';
import 'package:flutter25/notes/notes_screen.dart';
import 'package:flutter25/quiz/quiz_login_screen.dart';
import 'package:flutter25/quiz/quiz_main_screen.dart';

import 'blog/blog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? QuizLoginScreen()
          : const QuizMainScreen(),
    );
  }
}

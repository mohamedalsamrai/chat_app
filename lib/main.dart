import 'package:chat_app/Services/auth_gate.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/Home_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomePage.id: (context) => HomePage()},
      debugShowCheckedModeBanner: false,
      home: const Scaffold(backgroundColor: Color(0xFFFFFFFF), body: AuthGate()),
    );
  }
}

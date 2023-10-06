import 'package:flutter/material.dart';
import 'package:temu/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:temu/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: ProfileScreen(),
  ));
}

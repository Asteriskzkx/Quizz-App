// Suggested code may be subject to a license. Learn more: ~LicenseLog:957196318.
import 'package:flutter/material.dart';
import 'package:myapp/questions_screen.dart';
import 'package:myapp/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.deepOrange],
            ),
          ),
          child: const StartScreen()),
    ),
  ));
}

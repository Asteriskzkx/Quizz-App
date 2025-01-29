import 'package:flutter/material.dart';
import 'package:myapp/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Futura'),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.deepOrange,
              ],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}

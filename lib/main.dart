import 'package:flutter/material.dart';
import 'Ui/Home.dart';

void main() => runApp( MaterialApp(
      theme: ThemeData(brightness: Brightness.dark,
        primaryColor: Colors.lightGreenAccent,
      ),
      home: const QuizApp(),
    ));

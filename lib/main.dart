import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Fundamental 2',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
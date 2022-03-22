import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:flutter_fundamental_2/ui/detail_screen.dart';
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
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
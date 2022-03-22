import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/ui/restaurant_list_page.dart';

class HomeScreen extends StatelessWidget{
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: RestaurantListPage(),
    );
  }
}
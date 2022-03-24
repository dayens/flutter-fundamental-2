import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/ui/search_screen.dart';
import 'package:flutter_fundamental_2/widgets/restaurant_list_page.dart';


class HomeScreen extends StatelessWidget{
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: RestaurantListPage()
    );
  }
}
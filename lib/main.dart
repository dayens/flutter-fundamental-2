import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:flutter_fundamental_2/provider/resto_provider.dart';
import 'package:flutter_fundamental_2/provider/searchProvider.dart';
import 'package:flutter_fundamental_2/ui/detail_screen.dart';
import 'package:flutter_fundamental_2/ui/home_screen.dart';
import 'package:flutter_fundamental_2/ui/search_screen.dart';
import 'package:provider/provider.dart';
import 'data/api_service/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoProvider>(
          create: (_) => RestoProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchRestaurantProvider>(
          create: (_) => SearchRestaurantProvider(apiService: ApiService()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Fundamental 2',
        theme: ThemeData(),
        home: HomeScreen(),
        routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant
        ),
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/provider/resto_provider.dart';
import 'package:flutter_fundamental_2/widgets/restaurant_list_page.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: ChangeNotifierProvider<RestoProvider>(
        create: (_) => RestoProvider(apiService: ApiService()),
        child: RestaurantListPage(),
      ),
    );
  }
}
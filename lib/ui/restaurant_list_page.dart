import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:flutter_fundamental_2/widgets/platform_widget.dart';

import '../widgets/card_restaurant.dart';

class RestaurantListPage extends StatefulWidget {

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantResult> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().listRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidbuilder: _buildAndroid,
      iosbuilder: _buildAndroid,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildList(context),
    );
  }

  Widget _buildList (BuildContext context) {
    return FutureBuilder(
      future: _restaurant,
      builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = snapshot.data?.restaurants[index];
                return CardRestaurant(restaurant: restaurant!);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        }
      },
    );
  }
}
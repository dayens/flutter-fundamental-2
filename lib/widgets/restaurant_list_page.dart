import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/provider/resto_provider.dart';
import 'package:flutter_fundamental_2/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

import 'card_restaurant.dart';

class RestaurantListPage extends StatelessWidget {

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
    return Consumer<RestoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state.state == ResultState.HasData) {
            return Scaffold(
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = state.result.restaurants[index];
                  return CardRestaurant(restaurant: restaurant);
                },
              ),
            );
          } else if (state.state == ResultState.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.Error){
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        }
      },
    );
  }
}
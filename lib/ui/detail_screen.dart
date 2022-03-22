import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:flutter_fundamental_2/widgets/platform_widget.dart';

import '../widgets/detail_pages.dart';

class DetailScreen extends StatefulWidget {

  static const routeName = '/detail_screen';

  final Restaurant restaurant;

  DetailScreen ({required this.restaurant});




  @override
  State<DetailScreen> createState() => _DetailScreenState(restaurant2: restaurant);
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailResult> _restaurant;

  Restaurant restaurant2;
  //late DetailRestaurant detailRestaurant;

  _DetailScreenState ({required this.restaurant2});

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().detailRestaurant(restaurant2.id);
  }

  Widget _buildList (BuildContext context) {
    return FutureBuilder(
      future: _restaurant,
      builder: (context, AsyncSnapshot<DetailResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            //DetailRestaurant dRes = restaurant2 as DetailRestaurant;
            //return DetailPage(restaurant: dRes);
            var restaurant = snapshot.data?.restaurants;
            return Scaffold(
              body: DetailPage(restaurant: restaurant!),
              //shrinkWrap: true,
              //itemCount: snapshot.data?.restaurants.length,
              //itemBuilder: (context, index) {


              //},
              
             
            );

          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Text('');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidbuilder: _buildList,
      iosbuilder: _buildList,
    );
  }
}
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
  State<DetailScreen> createState() => _DetailScreenState(idRes: restaurant);
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailResult> _restaurant;
  Restaurant idRes;

  _DetailScreenState ({required this.idRes});

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().detailRestaurant(idRes.id);
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
            var restaurant = snapshot.data?.restaurants;
            return Scaffold(
              body: DetailPage(restaurant: restaurant!),
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
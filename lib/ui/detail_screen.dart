import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:flutter_fundamental_2/provider/detail_provider.dart';
import 'package:flutter_fundamental_2/widgets/platform_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/detail_pages.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail_screen';

  DetailScreen ({required this.restaurant});
  final Restaurant restaurant;

  Widget _buildList (BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService(), resto: restaurant.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Restaurant'),
        ),
        body: Consumer<DetailProvider>(
          builder: (context, data, _) {
            if (data.state == DetailResultState.Loading) {
              return Center(child: CircularProgressIndicator(),);
            } else if (data.state == DetailResultState.HasData) {
              return Scaffold(
                body: DetailPage(restaurant: data.detailResult.restaurants),
              );
            } else if (data.state == DetailResultState.NoData) {
              return Center(child: Text(data.message));
            } else if (data.state == DetailResultState.Error) {
              return Center(child: Text(data.message));
            } else {
              return Center(child: Text(''));
            }
          }
        ),
      ),
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
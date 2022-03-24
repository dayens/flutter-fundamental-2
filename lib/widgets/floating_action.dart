import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';
import 'package:search_page/search_page.dart';
import '../ui/detail_screen.dart';

class FloatingAction extends StatelessWidget {
  List<Restaurant> restaurant;

  FloatingAction({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.search),
      tooltip: 'Search people',
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage<Restaurant>(
          items: restaurant,
          searchLabel: 'Search people',
          suggestion: Center(
            child: Text('Filter people by name, surname or age'),
          ),
          failure: Center(
            child: Text('No person found :('),
          ),
          filter: (person) => [
            person.name,
            person.city,
            person.rating.toString(),
          ],
          builder: (data) => ListTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: data as Restaurant);
            },
            title: Text(data.name),
            subtitle: Text(data.city),
            trailing: Text(data.rating),
          ),
        ),
      ),
    );
  }
}
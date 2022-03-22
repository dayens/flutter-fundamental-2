import 'dart:convert';

import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';
import 'package:flutter_fundamental_2/ui/detail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_fundamental_2/data/model/restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _list = 'list';
  static final String _detail = 'detail/';
  static final String _throw = 'Failed load data';
  //String? id;


  Future<RestaurantResult> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  Future<DetailRestaurant> detailRestaurant(id) async {
    String? id;
    final response = await http.get(Uri.parse(_baseUrl + _detail + '$id'));
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }
}
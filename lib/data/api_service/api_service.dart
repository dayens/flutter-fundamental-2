import 'dart:convert';

import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_fundamental_2/data/model/restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _list = 'list';
  static final String _detail = 'detail/';
  static final String _search = 'search?q=';
  static final String _throw = 'Failed load data';

  Future<RestaurantResult> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  Future<DetailResult> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + '$id'));
    if (response.statusCode == 200) {
      return DetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }
}
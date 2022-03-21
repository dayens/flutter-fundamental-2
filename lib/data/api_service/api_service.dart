import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_fundamental_2/data/model/restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String _list = 'list';

  Future<Restaurant> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed load data');
    }
  }
}
import 'package:flutter/material.dart';
import '../data/api_service/api_service.dart';
import '../data/model/search.dart';
import '../utils/result_state.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService}) {
    fetchQueryRestaurant(query);
  }

  RestaurantSearch? _restaurantList;
  ResultState? _state;
  String _message = '';
  String _query = '';

  String get message => _message;
  String get query => _query;
  RestaurantSearch? get result => _restaurantList;
  ResultState? get state => _state;

  Future<dynamic> fetchQueryRestaurant(String query) async {
    try {
      if (query.isNotEmpty) {
        _state = ResultState.loading;
        _query = query;
        notifyListeners();
        final restaurantList = await apiService.searchRestaurant(query);
        if (restaurantList.restaurants.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _restaurantList = restaurantList;
        }
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> Failed Load Data, please check your internet connection';
    }
  }
}
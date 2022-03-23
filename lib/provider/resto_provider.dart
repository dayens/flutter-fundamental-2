import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';
import 'package:flutter_fundamental_2/data/model/restaurant.dart';

enum ResultState { Loading , NoData, HasData, Error}

class RestoProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoProvider ({required this.apiService}) {
    _fetchAllRestaurant();
    _fetchDetailRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late DetailResult _detailResult;
  late ResultState _state;
  String _message = '';

  RestaurantResult get result => _restaurantResult;
  DetailResult get detailResult => _detailResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.listRestaurant();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      var id;
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.detailRestaurant(id);
      if (restaurant.restaurants == ResultState.NoData) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
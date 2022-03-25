import 'package:flutter/material.dart';
import 'package:flutter_fundamental_2/data/api_service/api_service.dart';
import 'package:flutter_fundamental_2/data/model/detail_restaurant.dart';

enum DetailResultState { Loading , NoData, HasData, Error}

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String resto;

  DetailProvider ({required this.apiService, required this.resto}) {
    _fetchDetailRestaurant();
  }

  late DetailResult _detailResult;
  late DetailResultState _state;
  String _message = '';

  DetailResult get detailResult => _detailResult;
  DetailResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.detailRestaurant(resto);
      if (restaurant.restaurants == DetailResultState.NoData) {
        _state = DetailResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _detailResult = restaurant;
      }
    } catch (e) {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message = 'Error --> Failed Load Data';
    }
  }
}
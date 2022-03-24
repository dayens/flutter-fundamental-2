// import 'package:flutter/material.dart';
// import '../data/api_service/api_service.dart';
//
// enum SearchResultState { Loading , NoData, HasData, Error}
//
// class SearchProvider extends ChangeNotifier {
//   final ApiService apiService;
//
//   SearchProvider ({required this.apiService}) {
//     _fetchDetailRestaurant();
//   }
//
//   late SearchResult _searchResult;
//   late SearchResultState _state;
//   String _message = '';
//
//   SearchResult get searchResult => _searchResult;
//   SearchResultState get state => _state;
//   String get message => _message;
//
//   Future<dynamic> _fetchSearch() async {
//     try {
//       _state = SearchResultState.Loading;
//       notifyListeners();
//       final restaurant = await apiService.detailRestaurant();
//       if (restaurant.restaurants == SearchResultState.NoData) {
//         _state = SearchResultState.NoData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = SearchResultState.HasData;
//         notifyListeners();
//         return _searchResult = restaurant;
//       }
//     } catch (e) {
//       _state = SearchResultState.Error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
// }
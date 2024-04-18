import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteProvider extends ChangeNotifier {
  List<FoodItem> _favoriteFood = [];
  List<FoodItem> get products => _favoriteFood;

  void toggleFavorite(FoodItem foodItem) {
    final isExisting = _favoriteFood.contains(foodItem);
    if (isExisting) {
      _favoriteFood.remove(foodItem);
    } else {
      _favoriteFood.add(foodItem);
    }
    notifyListeners();
  }

  bool isExist(FoodItem foodItem) {
    final isExisting = _favoriteFood.contains(foodItem);
    return isExisting;
  }

  void clearFavorite() {
    _favoriteFood = [];
    notifyListeners();
  }
}

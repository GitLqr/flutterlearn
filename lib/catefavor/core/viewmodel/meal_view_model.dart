import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/services/meal_request.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  MealViewModel() {
    MealRequest.getMealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }
}

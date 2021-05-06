import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';

import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  FilterViewModel _filterVM;

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originalMeals {
    return _meals;
  }

  void updateFilters(FilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }
}

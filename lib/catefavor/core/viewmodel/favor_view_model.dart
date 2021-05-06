import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/viewmodel/base_view_model.dart';

class FavorViewModel extends BaseMealViewModel {
  void addMeal(MealModel meal) {
    originalMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    originalMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(MealModel meal) {
    return originalMeals.contains(meal);
  }
}

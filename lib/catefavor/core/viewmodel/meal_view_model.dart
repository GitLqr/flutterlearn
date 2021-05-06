import 'package:flutterlearn/catefavor/core/services/meal_request.dart';

import 'base_view_model.dart';

class MealViewModel extends BaseMealViewModel {
  MealViewModel() {
    MealRequest.getMealData().then((res) {
      meals = res;
    });
  }
}

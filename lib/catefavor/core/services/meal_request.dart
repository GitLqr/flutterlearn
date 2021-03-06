import 'dart:convert';

import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/services/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealData() async {
    // 1. 发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2. json转model
    final resultList = result["meal"];
    List<MealModel> meals = [];
    for (var json in resultList) {
      meals.add(MealModel.fromJson(json));
    }

    return meals;
  }
}
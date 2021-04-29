import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/category_model.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/viewmodel/meal_view_model.dart';
import 'package:flutterlearn/catefavor/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

// class MealContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final category = ModalRoute.of(context).settings.arguments as CategoryModel;
//     return Consumer<MealViewModel>(
//       builder: (ctx, mealVM, child) {
//         print(mealVM.meals);
//         final meals = mealVM.meals
//             .where((meal) => meal.categories.contains(category.id))
//             .toList();
//         return ListView.builder(
//           itemCount: meals.length,
//           itemBuilder: (ctx, index) {
//             return ListTile(title: Text(meals[index].title));
//           },
//         );
//       },
//     );
//   }
// }

class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
      selector: (ctx, mealVM) => mealVM.meals
          .where((meal) => meal.categories.contains(category.id))
          .toList(),
      // 当前后两边数据不同的时候刷新
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meals[index]),
        );
      },
    );
  }
}

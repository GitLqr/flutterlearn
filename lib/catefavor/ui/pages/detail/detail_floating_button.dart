import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

class DetailFloatingButton extends StatelessWidget {
  final MealModel _meal;

  DetailFloatingButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        // 判断是否是收藏状态
        final iconData =
            favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        return FloatingActionButton(
          child: Icon(iconData, color: iconColor),
          onPressed: () {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}

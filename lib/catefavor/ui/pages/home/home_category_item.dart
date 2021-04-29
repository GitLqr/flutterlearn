import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/category_model.dart';
import 'package:flutterlearn/catefavor/core/extension/int_extension.dart';
import 'package:flutterlearn/catefavor/ui/pages/meal/meal.dart';

class HomeCategoryItem extends StatelessWidget {
  final CategoryModel _category;

  HomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(.5),
              bgColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.display2.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealScreen.routeName, arguments: _category);
      },
    );
  }
}

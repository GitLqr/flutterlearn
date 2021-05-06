import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/ui/pages/detail/detail_content.dart';

class DetailScreen extends StatelessWidget {
  static final routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: DetailContent(meal),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}

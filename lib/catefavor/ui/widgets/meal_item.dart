import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/extension/int_extension.dart';
import 'package:flutterlearn/catefavor/core/viewmodel/favor_view_model.dart';
import 'package:flutterlearn/catefavor/ui/pages/detail/detail.dart';
import 'package:provider/provider.dart';

import 'operation_item.dart';

class MealItem extends StatelessWidget {
  final cardRadius = 12.px;
  final MealModel _meal;

  MealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
          OperationItem(Icon(Icons.restaurant), "${_meal.complexityStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        final iconData =
            favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";
        return GestureDetector(
          child: OperationItem(
            Icon(iconData, color: favorColor),
            title,
            textColor: favorColor,
          ),
          onTap: () {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}

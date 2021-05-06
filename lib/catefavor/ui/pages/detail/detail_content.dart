import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/model/meal_model.dart';
import 'package:flutterlearn/catefavor/core/extension/int_extension.dart';

class DetailContent extends StatelessWidget {
  final MealModel _meal;

  DetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  // 1. 横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2. 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        // 压缩包裹(默认ListView会尽可能占据父widget的高度, 但Column又需要子widget有明确高度, 两者冲突, 所以需要把ListView的高度设置为包裹内容)
        shrinkWrap: true,
        // 当高度超过一屏时, ListView的高度会刚好到屏幕底部, 这样就会出现局部滚动显像, 所以把滚动效果去掉, 让ListView就是完全包裹内容.
        physics: NeverScrollableScrollPhysics(),
        // 在旧版本的ListView中, 包裹内容底部会多出一块内间距, 需要将其去除
        padding: EdgeInsets.zero,
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  // 3. 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _meal.steps.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index + 1}"),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
      ),
    );
  }

  // 4. 公共方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .display3
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMakeContent({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}

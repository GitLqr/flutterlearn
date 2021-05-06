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
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(),
          buildMakeSteps(),
        ],
      ),
    );
  }

  // 1. 横幅图片
  Widget buildBannerImage() {
    return Container(
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2. 制作材料
  Widget buildMakeMaterial() {
    return Container(
      color: Colors.orange,
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  // 3. 制作步骤
  Widget buildMakeSteps() {
    return Text("制作步骤");
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
}

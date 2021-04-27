import 'package:flutter/material.dart';

class StackDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/FSA_QR.png"),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            color: Color.fromARGB(160, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "欢迎关注公众号: FSA全栈行为",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: () => print("点击了收藏"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Stack默认的大小是包裹内容的
    ///   - alignment: 指定从什么位置开始摆放所有的子Widget
    ///   - fit: expand(很少用) 将子元素拉伸到尽可能大
    ///   - overflow: 超出部分如何处理
    /// Positioned: 定位
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      // fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.asset("assets/images/FSA_QR.png"),
        Positioned(
          left: 20,
          bottom: -50,
          child: Container(width: 150, height: 150, color: Colors.red),
        ),
        Positioned(
          right: 0,
          child: Text(
            "lqr",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                backgroundColor: Colors.black),
          ),
        )
      ],
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Flexible 中的属性:
    /// - fit: 填充模式
    ///   - tight: 子控件强制填满可用空间
    ///   - loose: 子控件只占用本身大小
    /// - flex: 当fit为tight时才会生效 (重点: width比 = flex比)
    ///   - 不指定flex时: 按等分的方式来拉伸 Flexible 直至填满可用空间, 相当于flex都是1
    ///   - 有指定flex时: 按flex的比例来拉伸 Flexible 直至填满可用空间, 此时原本的width已经无效了
    ///
    /// Expanded = Flexible(fit: FlexFit.tight)
    /// - 当Flex(Row/Column)还有可用空间时, 拉伸子控件大小
    /// - 当子控件超出Flex(Row/Column)空间时, 缩小子控件大小
    return Column(
      children: [
        item1(),
        tip("Flexible fit: FlexFit.tight flex: 1"),
        item2(),
        tip("Expanded flex: 1 , flex: 1 (width: 120)"),
        item3(),
        tip("Expanded flex: 1 , flex: 2 (width: 10000)"),
      ],
    );
  }

  Widget item1() {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(width: 80, height: 60, color: Colors.red),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(width: 120, height: 100, color: Colors.green),
        ),
        Container(width: 90, height: 80, color: Colors.blue),
        Container(width: 50, height: 120, color: Colors.orange),
      ],
    );
  }

  Widget item2() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(width: 80, height: 60, color: Colors.red),
        ),
        Expanded(
          flex: 1,
          child: Container(width: 120, height: 100, color: Colors.green),
        ),
        Container(width: 90, height: 80, color: Colors.blue),
        Container(width: 50, height: 120, color: Colors.orange),
      ],
    );
  }

  Widget item3() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(width: 80, height: 60, color: Colors.red),
        ),
        Expanded(
          flex: 2,
          child: Container(width: 10000, height: 100, color: Colors.green),
        ),
        Container(width: 90, height: 80, color: Colors.blue),
        Container(width: 50, height: 120, color: Colors.orange),
      ],
    );
  }

  Widget tip(String content) {
    return Text(
      "GitLqr >>> $content",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        backgroundColor: Colors.black54,
      ),
    );
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Row: 排版方向 TextDirection
    ///   - rtl: 从右到左排版
    ///   - ltr: 从左到右排版(默认)
    /// Column: 排版方向 VerticalDirection
    ///   - up: 从下到上排版
    ///   - down: 从上到下排版(默认)
    return Row(children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          // up: 从下到上排版; down: 从上到下排版(默认)
          children: [
            Container(width: 80, height: 60, color: Colors.red),
            Container(width: 120, height: 100, color: Colors.green),
            Container(width: 90, height: 80, color: Colors.blue),
            Container(width: 50, height: 120, color: Colors.orange),
            Text(
              "GitLqr >>> VerticalDirection.down",
              style: TextStyle(fontSize: 20, backgroundColor: Colors.black54, color: Colors.white),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          // up: 从下到上排版; down: 从上到下排版(默认)
          children: [
            Container(width: 80, height: 60, color: Colors.red),
            Container(width: 120, height: 100, color: Colors.green),
            Container(width: 90, height: 80, color: Colors.blue),
            Container(width: 50, height: 120, color: Colors.orange),
            Text(
              "GitLqr >>> VerticalDirection.up",
              style: TextStyle(fontSize: 20, backgroundColor: Colors.black54, color: Colors.white),
            ),
          ],
        ),
      ),
    ]);
  }
}

class RowDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 基线对齐
    return Column(
      children: [
        itemRow("spaceEvenly", MainAxisAlignment.spaceEvenly, "start", CrossAxisAlignment.start),
        itemRow("spaceEvenly", MainAxisAlignment.spaceEvenly, "center", CrossAxisAlignment.center),
        itemRow("spaceEvenly", MainAxisAlignment.spaceEvenly, "end", CrossAxisAlignment.end),
        itemRow("spaceEvenly", MainAxisAlignment.spaceEvenly, "stretch", CrossAxisAlignment.stretch),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          // alphabetic 与 ideographic 这2种基线几乎没差
          textBaseline: TextBaseline.ideographic,
          children: [
            Container(width: 80,height: 60, color: Colors.red, child: Text("Hellxo", style: TextStyle(fontSize: 20))),
            Container(width: 120, height: 100, color: Colors.green, child: Text("Woxrld", style: TextStyle(fontSize: 30)),),
            Container(width: 90, height: 80, color: Colors.blue, child: Text("abxc", style: TextStyle(fontSize: 12))),
            Container(width: 50, height: 120, color: Colors.orange, child: Text("cxba", style: TextStyle(fontSize: 40))),
          ],
        ),
      ],
    );
  }

  Widget itemRow(
      String mainAxisAlignmentStr,
      MainAxisAlignment mainAxisAlignment,
      String crossAxisAlignmentStr,
      CrossAxisAlignment crossAxisAlignment) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(bottom: 8.0),
      color: Colors.pink[100],
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            // textDirection: TextDirection.ltr, // rtl: 从右到左排版; ltr: 从左到右排版(默认)
            children: [
              Container(width: 80, height: 60, color: Colors.red),
              Container(width: 120, height: 100, color: Colors.green),
              Container(width: 90, height: 80, color: Colors.blue),
              Container(width: 50, height: 120, color: Colors.orange),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              "GitLqr >>> main:$mainAxisAlignmentStr , cross:$crossAxisAlignmentStr",
              style: TextStyle(fontSize: 20, backgroundColor: Colors.black54, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class RowDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MainAxisAlignment:
    ///   - start: 主轴的开始位置挨个摆放元素
    ///   - end: 主轴的结束位置挨个摆放元素
    ///   - center: 主轴的中心点对齐
    ///   - spaceBetween: 左右两边的间距为0，其它元素之间平分间距
    ///   - spaceAround: 左右两边的间距是其它元素之间的间距的一半
    ///   - spaceEvenly: 所有的间距平分空间
    /// CrossAxisAlignment:
    ///   - start: 交叉轴的起始位置对齐
    ///   - end: 交叉轴的结束位置对齐
    ///   - center: 中心点对齐(默认值)
    ///   - baseline: 基线对齐(必须有文本的时候才起效果)
    ///     * 使用baseline对齐必须指定textBaseline, 否则会报错.
    ///   - stretch: 先让Row占据交叉轴尽可能大的空间, 将所有子widget交叉轴的高度, 拉伸到最大
    return Column(
      children: [
        itemRow("start", MainAxisAlignment.start, "center", CrossAxisAlignment.center),
        itemRow("end", MainAxisAlignment.end, "center", CrossAxisAlignment.center),
        itemRow("center", MainAxisAlignment.center, "center", CrossAxisAlignment.center),
        itemRow("spaceBetween", MainAxisAlignment.spaceBetween, "center", CrossAxisAlignment.center),
        itemRow("spaceAround", MainAxisAlignment.spaceAround, "center", CrossAxisAlignment.center),
        itemRow("spaceEvenly", MainAxisAlignment.spaceEvenly, "center", CrossAxisAlignment.center),
      ],
    );
  }

  Widget itemRow(
      String mainAxisAlignmentStr,
      MainAxisAlignment mainAxisAlignment,
      String crossAxisAlignmentStr,
      CrossAxisAlignment crossAxisAlignment) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 8.0),
      color: Colors.pink[100],
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            // textDirection: TextDirection.ltr, // rtl: 从右到左排版; ltr: 从左到右排版(默认)
            children: [
              Container(width: 80, height: 60, color: Colors.red),
              Container(width: 120, height: 100, color: Colors.green),
              Container(width: 90, height: 80, color: Colors.blue),
              Container(width: 50, height: 120, color: Colors.orange),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              "GitLqr >>> main:$mainAxisAlignmentStr , cross:$crossAxisAlignmentStr",
              style: TextStyle(fontSize: 20, backgroundColor: Colors.black54, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

// class RowDemo1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     /// MainAxisAlignment:
//     ///   - start: 主轴的开始位置挨个摆放元素
//     ///   - end: 主轴的结束位置挨个摆放元素
//     ///   - center: 主轴的中心点对齐
//     ///   - spaceBetween: 左右两边的间距为0，其它元素之间平分间距
//     ///   - spaceAround: 左右两边的间距是其它元素之间的间距的一半
//     ///   - spaceEvenly: 所有的间距平分空间
//     /// CrossAxisAlignment:
//     ///   - start: 交叉轴的起始位置对齐
//     ///   - end: 交叉轴的结束位置对齐
//     ///   - center: 中心点对齐(默认值)
//     ///   - baseline: 基线对齐(必须有文本的时候才起效果)
//     ///     * 使用baseline对齐必须指定textBaseline, 否则会报错.
//     ///   - stretch: 先让Row占据交叉轴尽可能大的空间, 将所有子widget交叉轴的高度, 拉伸到最大
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       // textDirection: TextDirection.ltr, // rtl: 从右到左排版; ltr: 从左到右排版(默认)
//       children: [
//         Container(width: 80, height: 60, color: Colors.red),
//         Container(width: 120, height: 100, color: Colors.green),
//         Container(width: 90, height: 80, color: Colors.blue),
//         Container(width: 50, height: 120, color: Colors.orange),
//       ],
//     );
//   }
// }

class ButtonRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Row特点:
    ///   - 水平方向尽可能占据比较大的空间
    ///     * 如果水平方向希望包裹内容,可以设置 mainAxisSize = min
    ///   - 垂直方向包裹内容
    ///
    /// Row/Column: 继承自Flex
    /// Flex: Css Flex布局，直接使用的比较少
    /// Row = Flex(direction: Axis.horizontal)
    ///   mainAxis(主轴): 水平向右
    ///   crossAxis(交叉轴): 竖直向下
    /// Column = Flex(direction: Axis.vertical)
    ///   mainAxis(主轴): 竖直向下
    ///   crossAxis(交叉轴): 水平向右
    return Column(
      children: [
        RaisedButton(
          child: Row(
            children: [Icon(Icons.bug_report), Text("bug报告(MainAxisSize.max)")],
          ),
          onPressed: () {},
        ),
        RaisedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min, // 包裹内容。包裹是max占满父widget
            children: [Icon(Icons.bug_report), Text("bug报告(MainAxisSize.min)")],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

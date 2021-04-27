import 'package:flutter/material.dart';
import 'package:flutterlearn/douban/model/home_model.dart';
import 'package:flutterlearn/douban/widgets/dashed_line.dart';
import 'package:flutterlearn/douban/widgets/star_rating.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  HomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8, color: Color(0xffcccccc)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(height: 8),
          buildContent(),
          SizedBox(height: 8),
          buildFooter(),
        ],
      ),
    );
  }

  /// 1. 头部的排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131, 95, 36),
        ),
      ),
    );
  }

  /// 2. 内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 8),
        buildContentInfo(),
        SizedBox(width: 8),
        buildContentDashLine(),
        SizedBox(width: 8),
        buildContentWish(),
      ],
    );
  }

  /// 2.1. 内容的图片
  Widget buildContentImage() {
    // ClipRadiusRect
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
    );
  }

  /// 2.2. 内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: IntrinsicHeight(
        child: Column(
          children: [
            buildContentInfoTitle(),
            SizedBox(height: 8),
            buildContentInfoRating(),
            SizedBox(height: 8),
            buildContentInfoDesc(),
          ],
        ),
      ),
    );
  }

  Widget buildContentInfoTitle() {
    /// Row: 当空间不足时不会自动换行
    /// Text.rich: 当空间不足时会自动换行
    return Text.rich(
      TextSpan(
        children: [
          /// 如果使用 WidgetSpan + TextSpan + TextSpan, 是无法做到三者居中对齐的;
          /// 可以改用 WidgetSpan(alignment:middle) + WidgetSpan(alignment:middle) + WidgetSpan(alignment:middle)
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.redAccent,
              size: 24,
            ),
            alignment: PlaceholderAlignment.middle,
          ),

          /// 电影名, 一个 InlineSpan 的内容不会换行, 所以当名字过长时, 就会发现 图标,电影名,年份 各占一行, 这不是我们想要的,
          /// 所以, 为了解决电影名过长导致的上述问题, 可以对电影名进行切片, 一个字符对应一个 InlineSpan.
          // WidgetSpan(
          //   child: Text(
          //     movie.title,
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          //   alignment: PlaceholderAlignment.middle,
          // ),
          /// movie.title.runes: "GitLqr" --> 'G' 'i' 't' 'L' 'q' 'r'
          ...movie.title.runes.map((charCode) {
            return WidgetSpan(
              child: Text(
                new String.fromCharCode(charCode),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              alignment: PlaceholderAlignment.middle,
            );
          }).toList(),

          WidgetSpan(
            child: Text(
              "(${movie.playDate})",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            alignment: PlaceholderAlignment.middle,
          ),
        ],
      ),
    );
  }

  Widget buildContentInfoRating() {
    return FittedBox(
      child: Row(
        children: [
          StarRating(rating: movie.rating, size: 20),
          SizedBox(width: 6),
          Text("${movie.rating}", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildContentInfoDesc() {
    final geresString = movie.genres.join(" "); // 类别
    final directorString = movie.director.name; // 导演
    final actorString = movie.casts.map((actor) => actor.name).join(" "); // 演员

    return Text(
      "$geresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  /// 2.3. 内容的虚线
  Widget buildContentDashLine() {
    return Container(
      height: 100,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: .5,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  /// 2.4. 内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/home/wish.png"),
          Text(
            "想看",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 235, 170, 60),
            ),
          ),
        ],
      ),
    );
  }

  /// 3. 尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}

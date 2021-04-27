import 'package:flutter/material.dart';
import 'package:flutterlearn/douban/model/home_model.dart';
import 'package:flutterlearn/douban/pages/home/home_movie_item.dart';
import 'package:flutterlearn/service/home_request.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    // 发送网络请求
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return HomeMovieItem(movies[index]);
      },
    );
  }
}

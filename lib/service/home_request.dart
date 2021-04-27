import 'package:flutterlearn/douban/model/home_model.dart';
import 'package:flutterlearn/service/config.dart';
import 'package:flutterlearn/service/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    // // 1. 构建URL
    // final movieURL =
    //     "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    //
    // // 2. 发送网络请求获取结果
    // final result = await HttpRequest.request(movieURL);
    // final subjects = result['subject'];
    //
    // // 3. 将map转成model
    // List<MovieItem> movies = [];
    // for (var sub in subjects) {
    //   movies.add(MovieItem.fromMap(sub));
    // }

    List<MovieItem> movies = [];
    var map = new Map<String, dynamic>();
    map['images'] = {
      'medium':
          'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp'
    };
    map['title'] = '肖申克的救赎 vs 肖申克的救赎';
    map['year'] = '1994';
    map['rating'] = {'average': 9.7};
    map['genres'] = ['犯罪', '剧情'];
    map['casts'] = [
      {
        'name': '蒂姆·罗宾斯',
        'avatars': {
          'medium':
              'https://img9.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp'
        }
      },
      {
        'name': '摩根·弗里曼',
        'avatars': {
          'medium':
              'https://img2.doubanio.com/view/celebrity/s_ratio_celebrity/public/p34642.webp'
        }
      },
      {
        'name': '鲍勃·冈顿',
        'avatars': {
          'medium':
              'https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5837.webp'
        }
      },
    ];
    map['directors'] = [
      {
        'name': '弗兰克·德拉邦特',
        'avatars': {
          'medium':
              'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp'
        }
      }
    ];
    map['original_title'] = 'The Shawshank Redemption';
    movies.addAll(
      List<MovieItem>.generate(20, (index) {
        map['rank'] = index;
        return MovieItem.fromMap(map);
      }),
    );

    // print(movies);

    return movies;
  }
}

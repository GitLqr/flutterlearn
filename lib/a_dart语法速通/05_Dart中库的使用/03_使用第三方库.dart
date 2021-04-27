// 需要有pubspec.yaml
// 填写好依赖项后，需要执行：`dart pub get` 或 `flutter pub get` 命令

import 'package:http/http.dart' as http;

main(List<String> args) async {
  var url = 'https://example.com/whatsit/create';
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(await http.read('https://example.com/foobar.txt'));
}

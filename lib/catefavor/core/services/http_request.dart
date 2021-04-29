import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(
    String url, {
    String method = "get",
    Map<String, dynamic> params,
    Interceptor inter,
  }) async {
    // 1. 创建单独配置
    final options = Options(method: method);

    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options, handler) {
        print("请求拦截");
        handler.next(options);
      },
      onResponse: (response, handler) {
        print("响应拦截");
        handler.next(response);
      },
      onError: (error, handler) {
        print("错误拦截");
        handler.next(error);
      },
    );
    List<Interceptor> inters = [dInter];
    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 2. 发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

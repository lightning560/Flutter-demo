import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'api.dart';
import 'proxy.dart';
import 'connections_interceptor.dart';
import 'request_interceptor.dart';

class RbHttp {
  ///超时时间
  static const CONNECT_TIMEOUT = Duration(seconds: 3);
  static const RECEIVE_TIMEOUT = Duration(seconds: 6);

  static RbHttp instance = RbHttp._internal();
  factory RbHttp() => instance;
  Dio dio = Dio();
  final CancelToken _cancelToken = CancelToken();
  RbHttp._internal() {
    dio.options
      ..baseUrl = Api.Local_MOCK_URL
      ..connectTimeout = CONNECT_TIMEOUT
      ..receiveTimeout = RECEIVE_TIMEOUT
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {};
    dio.interceptors.add(RequestInterceptor()); //自定义拦截
    dio.interceptors.add(ConnectsInterceptor()); //拦截网络
    dio.interceptors.add(LogInterceptor()); //打开日志
    // dio.interceptors.add(NetCacheInterceptor()); //

    if (PROXY_ENABLE) {
      dio.httpClientAdapter = IOHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          // Config the client.
          client.findProxy = (uri) {
            // Forward all request to proxy "PROXY_IP:$PROXY_PORT".
            return "PROXY $PROXY_IP:$PROXY_PORT";
          };
          // You can also create a new HttpClient for Dio instead of returning,
          // but a client must being returned here.
          // return client;
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
    }
  }

  void init(
      //这个在main或者初始化的时候先调用一下
      {String? baseUrl,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout!),
      receiveTimeout: Duration(milliseconds: receiveTimeout!),
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

/*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// restful get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var data = FormData.fromMap(params!);
    var response = await dio.post(path,
        data: data,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}

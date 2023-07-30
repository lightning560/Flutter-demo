import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/http_error.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    // TODO: implement onRequest
    super.onRequest(options, handler);
    // // 设置cookie
    // var cookie = SpUtil.getStringList('cookie');登录时保存cookie

    // if (options.path != 'api/auth/login' &&
    //     cookie != null &&
    //     cookie.length > 0) {
    //   options.headers['cookie'] = cookie;//这里就是除了登录的情况其他都加cookie
    // }
    // options.headers['User-Agent'] = 'gzzoc-1';//
    //
    // if (options.data?.runtimeType == FormData) {
    //   options.headers['content-type'] = 'multipart/form-data';//FormData这种情况改content-type
    // }

    // // 加载动画----这个就是请求页面时的那个loading窗 --处理逻辑 我是用options?.data['showLoading']或options?.queryParameters['showLoading'],
    //就是我们在传参的时候多加一个参数，这个因为前人就这样做的，也跟后端约定的，后端见showLoading不做处理。这样不是很好，反正options是有其他字段加的
    // if (options?.data?.runtimeType == FormData) {
    //   Alert.showLoading();
    // } else if ((options?.data != null &&
    //         false == options?.data['showLoading']) ||
    //     (options?.queryParameters != null &&
    //         false == options?.queryParameters['showLoading'])) {
    //   // 不显示加载动画
    // } else {
    //   Alert.showLoading();
    // }
    ///在这做请求时显不显示Loading的处理

    //return super.onRequest(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('=\n*** Response *** \n${response.toString()}');
    super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    // Alert.hide();关闭弹窗
    // 账户登录异常
    if (err.response != null &&
        err.response?.data != null &&
        err.response?.data is Map &&
        err.response?.data != null &&
        err.response?.data['code'] == '2') {
      // Alert.showAlert(
      //   message: err.message ?? '未知错误',
      //   showCancel: false,
      //   onConfirm: () {
      //     // 清除账号缓存
      //     SpUtil.putString("account_phone", '');
      //     SpUtil.putString("account_password", '');
      //     SpUtil.putObject("account", '');
      //
      //     // 退出到登录页面
      //     //  push(Routes.login, replace: true, clearStack: true);
      //   },
      // );
    } else {
      //    Alert.showAlert(message: err.message ?? '未知错误', showCancel: false);//在页面显示一个错误弹窗
    }
    HttpException httpException = HttpException.create(err);
    // err.error = httpException;
    return super.onError(err, handler);
  }
}

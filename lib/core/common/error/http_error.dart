import 'package:dio/dio.dart';
import '../log/rb_log.dart';

final logger = RbLog;

/// 自定义异常HttpException
class HttpException implements Exception {
  final String? _message;
  final int? _code;
  HttpException([
    this._code,
    this._message,
  ]);

  @override
  String toString() {
    return "$_message($_code)";
  }

  factory HttpException.create(DioError error) {
    logger.e('dio HttpException<-*->', error.message);
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, "请求取消");
        }
      case DioErrorType.connectionTimeout:
        {
          return BadRequestException(-1, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
      case DioErrorType.badResponse:
        {
          try {
            int? errCode = error.response?.statusCode!;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "请求语法错误");
                }
              case 401:
                {
                  return UnauthorisedException(errCode!, "没有权限");
                }
              case 403:
                {
                  return UnauthorisedException(errCode!, "服务器拒绝执行");
                }
              case 404:
                {
                  return UnauthorisedException(errCode!, "无法连接服务器");
                }
              case 405:
                {
                  return UnauthorisedException(errCode!, "请求方法被禁止");
                }
              case 500:
                {
                  return UnauthorisedException(errCode!, "服务器内部错误");
                }
              case 502:
                {
                  return UnauthorisedException(errCode!, "无效的请求");
                }
              case 503:
                {
                  return UnauthorisedException(errCode!, "服务器挂了");
                }
              case 505:
                {
                  return UnauthorisedException(errCode!, "不支持HTTP协议请求");
                }
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return HttpException(
                      errCode, error.response?.statusMessage ?? '');
                }
            }
          } on Exception catch (_) {
            return HttpException(-1, "未知错误");
          }
        }
      default:
        {
          return HttpException(-1, error.message);
        }
    }
  }
}

/// BadRequestException
class BadRequestException extends HttpException {
  BadRequestException([int? code, String? message]) : super(code!, message!);
}

/// UnauthorisedException
class UnauthorisedException extends HttpException {
  UnauthorisedException([int code = -1, String message = ''])
      : super(code, message);
}

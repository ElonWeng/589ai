import 'dart:convert';

import 'package:dio/dio.dart';

class DioManager {
  static DioManager?_instance ;
  static DioManager? getInstance() {
    _instance ??= DioManager();
    return _instance ;
  }

  Dio dio = Dio();
  DioManager() {
    dio.options.baseUrl = "https://www.baidu.com/" ;
    dio.options.connectTimeout = 5000 as Duration? ;
    dio.options.receiveTimeout = 3000 as Duration? ;
    dio.interceptors.add(LogInterceptor(requestBody: true));
    // dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //get请求
  get(String url, FormData params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttpMethod(url, successCallBack, 'get', params, errorCallBack);
  }
  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttpMethod(url, successCallBack, "post", params, errorCallBack);
  }
  //post请求
  postNoParams(
      String url, Function successCallBack, Function errorCallBack) async {
    _requestHttpMethod(url, successCallBack, "post", null, errorCallBack);
  }
  // 请求的主体
  _requestHttpMethod(String url , Function successCallBack , [String? method , FormData? params , Function? errorCallBack]) async {
    Response?response ;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url,
              queryParameters: Map.fromEntries(params.fields));
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null && params.fields.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error){
      // 请求错误处理
      _error(errorCallBack!, error.message as String);
      return '';
    }

    String dataStr = json.encode(response!.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap['status'] != 200) {
      _error(errorCallBack!, dataMap['msg'].toString());
    } else {
      successCallBack(dataMap);
    }

  }

  // 请求错误返回
  _error(Function errorCallBack, String error) {
    errorCallBack(error);
  }
}
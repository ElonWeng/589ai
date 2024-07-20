import 'package:dio/dio.dart';
import 'package:runtool/base/store/api.dart';
import 'package:runtool/net/dio_manger.dart';

class LoginApi {
  static Future<Response> postLogin(email, code) {
    var request = DioManger.request(LoginUrl.login_url,
        paramPost: {
          'email': email,
          'code': code,
        },
        method: DioManger.POST);
    return request;
  }
}

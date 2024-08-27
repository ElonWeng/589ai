import 'package:runtool/base/store/login_api.dart';

class LoginStore{

  //登录
  static Future<Map> login(email,code) async {
    var response =await LoginApi.postLogin(email, code);
    try{
      var data = response.data;
      if(data['code'] == 200){
        return {
          'success': true,
        };
      }else{
        return {
          'success': false,
        };
      }
    }catch(e){
      return {
        'success': false,
      };
    }
  }

  //获取邮箱验证码
  static Future<Map> sendEmailCode(email) async {
    var response = await LoginApi.getSendEmailCode(email);
    try{
      var data = response.data;
      if(data['code'] == 200){
        return {
          'success': true,
        };
      }else{
        return {
          'success': false,
          'msg': data['msg']
        };
      }
    }catch(e){
      return {
        'success': false,
        'msg': '获取失败'
      };
    }
  }

}
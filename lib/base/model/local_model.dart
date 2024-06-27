import 'package:flutter/material.dart';

class LocalModel with ChangeNotifier {
  Locale _locale = const Locale('en', ''); // 默认语言

  Locale get locale => _locale;

  set locale(Locale value) {
    if (_locale == value) return;
    _locale = value;
    notifyListeners(); // 通知监听者语言已更改
  }

  String getText(String key) {
    // 在这里，你可以根据key和locale返回相应的文本
    // 为了简单起见，我们直接返回硬编码的字符串
    switch (key) {
      case 'create':
        return _locale.languageCode == 'en' ? 'Create an account' : '创建账号';
      case 'emailTitle':
        return _locale.languageCode == 'en' ? 'Enter your email to sign up for this app' : '请输入邮箱账号来登录';
      case 'sighUp':
        return _locale.languageCode == 'en' ? 'Sign up with email' : '通过电子邮件注册';
      case 'emailValid':
        return _locale.languageCode == 'en' ? 'Valid email address' : '邮箱有效';
      case 'emailInput':
        return _locale.languageCode == 'en' ? 'Please enter a valid email address' : '请输入有效的邮箱地址';
      case 'or':
        return _locale.languageCode == 'en' ? 'or continue with' : '或者';
      case 'agree':
        return _locale.languageCode == 'en' ? 'By clicking continue, you agree to our' : '点击继续，即表示您同意我们的';
      case 'service':
        return _locale.languageCode == 'en' ? 'Terms of Service' : '服务条款';
      case 'and':
        return _locale.languageCode == 'en' ? ' and ' : ' 和 ';
      case 'privacy':
        return _locale.languageCode == 'en' ? 'Privacy Policy.' : '隐私政策。';
        default:
        return 'Key not found';
    }
  }
}
import 'package:flutter/material.dart';
import 'package:runtool/base/config/configs.dart';
import 'package:runtool/base/config/language_key.dart';
import 'package:runtool/base/config/language_text.dart';

class LocalModel with ChangeNotifier {
  Locale _locale =  Locale(Configs.language, ''); // 默认语言

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
        return _locale.languageCode == 'en' ? LanguageText.createEn : LanguageText.createZh;
      case 'emailTitle':
        return _locale.languageCode == 'en' ? LanguageText.inputEmailEn : LanguageText.inputEmailZh;
      case 'sighUp':
        return _locale.languageCode == 'en' ? LanguageText.sighUpEmailEn : LanguageText.sighUpEmailZh;
      case 'emailValid':
        return _locale.languageCode == 'en' ? LanguageText.validEmailEn : LanguageText.validEmailZh;
      case 'emailInput':
        return _locale.languageCode == 'en' ? LanguageText.inputValidEmailEn : LanguageText.inputValidEmailZh;
      case 'or':
        return _locale.languageCode == 'en' ? LanguageText.orContinueEn : LanguageText.orContinueZh;
      case 'agree':
        return _locale.languageCode == 'en' ? LanguageText.agreeEn : LanguageText.agreeZh;
      case 'service':
        return _locale.languageCode == 'en' ? LanguageText.serviceEn : LanguageText.serviceZh;
      case 'and':
        return _locale.languageCode == 'en' ? LanguageText.andEn : LanguageText.andZh;
      case 'privacy':
        return _locale.languageCode == 'en' ? LanguageText.privacyEn : LanguageText.privacyZh;
      case 'code_input':
        return _locale.languageCode == 'en' ? LanguageText.codeInputEn : LanguageText.codeInputZh;
      case LanguageKey.strCodeInputContent:
        return _locale.languageCode == 'en' ? LanguageText.codeInputContentEn : LanguageText.codeInputContentZh;
      default:
        return 'Key not found';
    }
  }
}
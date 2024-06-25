
import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier{
  String _text = 'Google';

  String getText() {
    return _text;
  }

  void setText(String text) {
    _text = text;
    // 当数据发生变化时，通知所有监听者
    notifyListeners();
  }
}
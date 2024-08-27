import 'package:flutter/cupertino.dart';

class ToastModel extends ChangeNotifier {
  String toastMsg = '';

  void setText(msg) {
    toastMsg = msg;
    notifyListeners();
  }

}
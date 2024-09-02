// navigation_service.dart
import 'package:flutter/material.dart';

import '../config/routes.dart';

class RoutesUtil {
  static void navigateToCode(BuildContext context, Map<String, dynamic> params) {
    Navigator.of(context).pushNamed(
      CODE_PAGE,
      arguments: params,
    );
  }
}
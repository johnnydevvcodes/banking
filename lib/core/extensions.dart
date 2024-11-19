import 'package:flutter/material.dart';

extension RouteExtension on BuildContext {
  Future toScreen(Widget screen, {ValueChanged? onResult}) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void pop([result]) {
    Navigator.pop(this, result);
  }

}

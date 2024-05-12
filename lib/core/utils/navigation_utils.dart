import 'package:flutter/material.dart';

class FlutterUtils {
  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  }
}

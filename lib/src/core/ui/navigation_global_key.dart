import 'package:flutter/material.dart';

class NavigationGlobalKey {
  static NavigationGlobalKey? _instance;
  NavigationGlobalKey._();

  final navKey = GlobalKey<NavigatorState>();
  static NavigationGlobalKey get i {
    _instance ??= NavigationGlobalKey._();
    return _instance!;
  }
}

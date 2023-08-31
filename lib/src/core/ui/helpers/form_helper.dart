import 'package:flutter/cupertino.dart';

void unFocus(BuildContext context) => FocusScope.of(context).unfocus();

extension UnfocusExtensions on BuildContext {
  void unFocus() => FocusScope.of(this).unfocus();
}

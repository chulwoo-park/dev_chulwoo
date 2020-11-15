import 'package:flutter/material.dart';

extension ScaffoldExtension on ScaffoldState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSimpleSnackBar(
    String text, {
    String actionLabel,
    VoidCallback onActionPressed,
  }) {
    Widget action;
    if (actionLabel != null) {
      action = SnackBarAction(
        label: actionLabel,
        onPressed: onActionPressed,
      );
    }

    return showSnackBar(
      SnackBar(
        content: Text(text),
        action: action,
      ),
    );
  }
}

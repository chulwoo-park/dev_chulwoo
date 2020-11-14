import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common.dart';

class AdaptivePage {
  /// The [title] parameter is only used in ios.
  static Page<T> create<T>({
    @required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey key,
    String name,
    Object arguments,
    String title,
  }) {
    assert(child != null);
    assert(maintainState != null);
    assert(fullscreenDialog != null);
    if (platform.isWeb) {
      return MaterialPage<T>(
        key: key,
        child: Builder(
          builder: (context) => WillPopScope(
            onWillPop: () async {
              if (Navigator.of(context).userGestureInProgress) {
                return false;
              } else {
                return true;
              }
            },
            child: child,
          ),
        ),
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
      );
    } else if (platform.isIOS) {
      return CupertinoPage<T>(
        key: key,
        child: child,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
        title: title,
      );
    } else {
      return MaterialPage<T>(
        key: key,
        child: child,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
      );
    }
  }
}

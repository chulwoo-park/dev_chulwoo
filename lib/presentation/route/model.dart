import 'package:dev_chulwoo/presentation/unknown/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'platform_page.dart';

abstract class AppRoute {
  const AppRoute();

  factory AppRoute.unknown() => _UnknownRoute();

  bool get isUnknown => this is _UnknownRoute;

  String get location;

  Widget get child;

  Page<T> createPage<T>({Key key}) {
    return AdaptivePage.create(
      key: key ?? UniqueKey(),
      name: location,
      child: child,
    );
  }
}

class _UnknownRoute extends AppRoute {
  @override
  Widget get child => UnknownScreen();

  @override
  String get location => '/404';
}

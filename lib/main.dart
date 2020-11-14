import 'package:dev_chulwoo/di/module.dart';
import 'package:dev_chulwoo/presentation/route/parser.dart';
import 'package:flutter/material.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'di/inject.dart';
import 'presentation/route/router.dart';

void main() {
  initDependencies();

  configureApp();
  runApp(DevChulwoo(inject()));
}

class DevChulwoo extends StatelessWidget {
  final LocationParser parser;
  final AppRouter router;

  DevChulwoo(this.parser) : router = AppRouter(parser);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chulwoo Park',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerDelegate: AppRouterDelegate(router),
      routeInformationParser: AppRouteInformationParser(parser),
    );
  }
}

import 'package:dev_chulwoo/presentation/route/parser.dart';
import 'package:flutter/material.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'presentation/route/router.dart';

void main() {
  configureApp();
  runApp(DevChulwoo());
}

class DevChulwoo extends StatelessWidget {
  final LocationParser parser = LocationParserImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chulwoo Park',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerDelegate: AppRouterDelegate(AppRouter(parser)),
      routeInformationParser: AppRouteInformationParser(parser),
    );
  }
}

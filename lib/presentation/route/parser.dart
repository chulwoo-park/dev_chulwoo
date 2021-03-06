import 'package:dev_chulwoo/presentation/home/screen.dart';
import 'package:dev_chulwoo/presentation/portfolio/screen.dart';
import 'package:dev_chulwoo/presentation/project/screen.dart';
import 'package:flutter/widgets.dart';

import 'model.dart';

abstract class LocationParser {
  AppRoute parse(String location);
}

class LocationParserImpl extends LocationParser {
  @override
  AppRoute parse(String location) {
    Uri uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return HomeRoute();
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'portfolio') {
        return PortfolioRoute();
      }
    } else if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'projects') {
        var remaining = uri.pathSegments[1];
        var id = int.tryParse(remaining);
        if (id != null) {
          return ProjectRoute(id);
        }
      }
    }

    return AppRoute.unknown();
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  final LocationParser parser;

  const AppRouteInformationParser(this.parser);

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async =>
      parser.parse(routeInformation.location);

  @override
  RouteInformation restoreRouteInformation(AppRoute path) => RouteInformation(location: path.location);
}

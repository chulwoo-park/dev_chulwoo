import 'package:dev_chulwoo/presentation/home/screen.dart';
import 'package:dev_chulwoo/presentation/route/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class AppRouter extends ChangeNotifier {
  AppRouter(this.parser);

  final LocationParser parser;

  static AppRouter of(BuildContext context) => Provider.of<AppRouter>(context, listen: false);

  static const Key _homeKey = const Key('root');

  List<Page> get pages => List.unmodifiable(_pages);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Page> _pages = [
    HomeRoute().createPage(key: _homeKey),
  ];

  AppRoute get currentRoute => parser.parse(_pages.last.name);

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  Future<void> setNewRoutePath(AppRoute configuration) async {
    if (configuration is HomeRoute) {
      _pages.removeWhere((element) => element.key != _homeKey);
    } else {
      _pages.add(configuration.createPage());
    }

    notifyListeners();
    return;
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final AppRouter router;

  AppRouterDelegate(this.router) {
    router.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppRouter>.value(
      value: router,
      child: Consumer<AppRouter>(
        builder: (context, router, _) {
          return Navigator(
            key: navigatorKey,
            onPopPage: _handleOnPopPage,
            pages: router.pages,
          );
        },
      ),
    );
  }

  bool _handleOnPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (didPop) {
      router.didPop(route.settings);
    }

    return didPop;
  }

  @override
  void dispose() {
    router.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => router.navigatorKey;

  @override
  AppRoute get currentConfiguration => router.currentRoute;

  @override
  Future<void> setNewRoutePath(AppRoute configuration) => router.setNewRoutePath(configuration);
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

import 'package:dev_chulwoo/presentation/portfolio/screen.dart';
import 'package:dev_chulwoo/presentation/route/model.dart';
import 'package:dev_chulwoo/presentation/route/router.dart';
import 'package:flutter/material.dart';

class HomeRoute extends AppRoute {
  const HomeRoute();

  @override
  String get location => '/';

  @override
  Widget get child => HomeScreen();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello world!'),
            FlatButton(
              onPressed: () {
                AppRouter.of(context).setNewRoutePath(PortfolioRoute());
              },
              child: Text('Portfolio'),
            ),
          ],
        ),
      ),
    );
  }
}

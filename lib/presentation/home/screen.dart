import 'package:dev_chulwoo/presentation/common/image.dart';
import 'package:dev_chulwoo/presentation/portfolio/screen.dart';
import 'package:dev_chulwoo/presentation/route/model.dart';
import 'package:dev_chulwoo/presentation/route/router.dart';
import 'package:flutter/material.dart';

import '../resources.dart';

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
            AppImage.asset(
              R.images.ic_android,
              semanticLabel: 'Android',
              width: 90.0,
            ),
            SizedBox(height: 6.0),
            FlatButton(
              onPressed: () {
                AppRouter.of(context).setNewRoutePath(PortfolioRoute());
              },
              child: Text(
                'Portfolio',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

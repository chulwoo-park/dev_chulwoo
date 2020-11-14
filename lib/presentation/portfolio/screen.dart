import 'package:dev_chulwoo/presentation/route/model.dart';
import 'package:flutter/material.dart';

class PortfolioRoute extends AppRoute {
  @override
  Widget get child => PortfolioScreen();

  @override
  String get location => '/portfolio';
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Portfolio'),
      ),
    );
  }
}

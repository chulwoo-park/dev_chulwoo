import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

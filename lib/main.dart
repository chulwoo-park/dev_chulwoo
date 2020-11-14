import 'package:flutter/material.dart';

void main() {
  runApp(DevChulwoo());
}

class DevChulwoo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Chulwoo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello world!'),
      ),
    );
  }
}

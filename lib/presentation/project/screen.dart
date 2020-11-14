import 'package:dev_chulwoo/presentation/route/model.dart';
import 'package:flutter/material.dart';

class ProjectRoute extends AppRoute {
  final int id;

  const ProjectRoute(this.id);

  @override
  Widget get child => ProjectScreen(id: id);

  @override
  String get location => '/projects/$id';
}

class ProjectScreen extends StatelessWidget {
  final int id;

  const ProjectScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id.toString()),
      ),
    );
  }
}

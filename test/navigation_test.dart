import 'package:dev_chulwoo/di/inject.dart';
import 'package:dev_chulwoo/di/module.dart';
import 'package:dev_chulwoo/main.dart';
import 'package:dev_chulwoo/presentation/home/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('앱 HomeScreen에서 시작', (WidgetTester tester) async {
    initDependencies();
    await tester.pumpWidget(DevChulwoo(inject()));

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

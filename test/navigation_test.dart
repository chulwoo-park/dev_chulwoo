import 'package:dev_chulwoo/main.dart';
import 'package:dev_chulwoo/presentation/home/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('앱 HomeScreen에서 시작', (WidgetTester tester) async {
    await tester.pumpWidget(DevChulwoo());

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

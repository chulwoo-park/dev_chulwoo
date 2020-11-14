import 'package:dev_chulwoo/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('root page test', (WidgetTester tester) async {
    await tester.pumpWidget(DevChulwoo());

    expect(find.text('Hello world!'), findsOneWidget);
  });
}

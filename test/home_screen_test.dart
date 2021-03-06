import 'package:dev_chulwoo/di/inject.dart';
import 'package:dev_chulwoo/di/module.dart';
import 'package:dev_chulwoo/main.dart';
import 'package:dev_chulwoo/presentation/portfolio/screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('포트폴리오 버튼 클릭 시 포트폴리오 화면으로 이동 ', (WidgetTester tester) async {
    initDependencies();
    await tester.pumpWidget(DevChulwoo(inject()));

    await tester.tap(find.text('Portfolio'));
    await tester.pumpAndSettle();

    expect(find.byType(PortfolioScreen), findsOneWidget);
  });
}

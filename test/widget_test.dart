import 'package:flutter_test/flutter_test.dart';
import 'package:teste_dev_flutter/app.dart';

void main() {
  testWidgets('App should render', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Census IBGE'), findsOneWidget);
  });
}

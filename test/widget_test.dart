import 'package:flutter_test/flutter_test.dart';

import 'package:ryu/main.dart';

void main() {
  testWidgets('Ryu shows tip calculator', (WidgetTester tester) async {
    await tester.pumpWidget(const RyuApp());

    expect(find.text('Ryu • Tip Calculator'), findsOneWidget);
    expect(find.text('Each person pays'), findsOneWidget);
  });
}
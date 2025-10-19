import 'package:currency_calc/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Check widgets exist
    expect(find.byKey(const Key("displayOne")), findsOneWidget);
    expect(find.byKey(const Key("displayTwo")), findsOneWidget);
    expect(find.byKey(const Key("result")), findsOneWidget);

    // Enter text and perform addition
    await tester.enterText(find.byKey(const Key("displayOne")), '20');
    await tester.enterText(find.byKey(const Key("displayTwo")), '30');
    await tester.tap(find.byIcon(CupertinoIcons.add));
    await tester.pump();

    // Verify result
    expect(find.text('50'), findsOneWidget);
  });
}


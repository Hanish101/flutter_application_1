import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator basic test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key("DisplayOne")), findsOneWidget);
    expect(find.byKey(const Key("DisplayTwo")), findsOneWidget);
    expect(find.byKey(const Key("outputKey")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    await tester.enterText(find.byKey(const Key("DisplayOne")), "20");
    await tester.enterText(find.byKey(const Key("DisplayTwo")), "10");

    await tester.tap(find.byIcon(CupertinoIcons.add));
    await tester.pump();
    expect(find.text("30"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();
    expect(find.text("10"), findsNWidgets(2));

    await tester.tap(find.byIcon(CupertinoIcons.multiply));
    await tester.pump();
    expect(find.text("200"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));
    await tester.pump();
    expect(find.text("0"), findsOneWidget);
  });
}

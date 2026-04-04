// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CupertinoApp is exported and renders', (WidgetTester tester) async {
    await tester.pumpWidget(const CupertinoApp(home: SizedBox.shrink()));
    expect(find.byType(CupertinoApp), findsOneWidget);
  });

  group('Foundation layer exports', () {
    test('CupertinoColors provides system colors', () {
      expect(CupertinoColors.activeBlue, isA<CupertinoDynamicColor>());
      expect(CupertinoColors.white, isA<Color>());
      expect(CupertinoColors.systemRed, isA<CupertinoDynamicColor>());
    });

    test('CupertinoIcons provides icon data', () {
      expect(CupertinoIcons.back, isA<IconData>());
      expect(CupertinoIcons.add, isA<IconData>());
    });

    test('CupertinoUserInterfaceLevelData enum values exist', () {
      expect(CupertinoUserInterfaceLevelData.values, hasLength(2));
      expect(CupertinoUserInterfaceLevelData.base, isNotNull);
      expect(CupertinoUserInterfaceLevelData.elevated, isNotNull);
    });

    test('CupertinoThemeData can be created', () {
      const themeData = CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.activeBlue,
      );
      expect(themeData.brightness, Brightness.dark);
    });

    test('CupertinoTextThemeData can be created', () {
      const textTheme = CupertinoTextThemeData();
      expect(textTheme, isNotNull);
    });

    test('CupertinoIconThemeData can be created', () {
      const iconTheme = CupertinoIconThemeData(size: 24.0);
      expect(iconTheme.size, 24.0);
    });

    test('CupertinoThumbPainter can be created', () {
      final painter = CupertinoThumbPainter();
      expect(painter, isNotNull);
    });
  });

  testWidgets('CupertinoActivityIndicator renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const CupertinoApp(
        home: CupertinoActivityIndicator(),
      ),
    );
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
  });

  testWidgets('CupertinoTheme provides theme data to descendants',
      (WidgetTester tester) async {
    late CupertinoThemeData capturedTheme;

    await tester.pumpWidget(
      CupertinoApp(
        theme: const CupertinoThemeData(brightness: Brightness.dark),
        home: Builder(
          builder: (BuildContext context) {
            capturedTheme = CupertinoTheme.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(capturedTheme.brightness, Brightness.dark);
  });

  testWidgets('CupertinoButton is accessible', (WidgetTester tester) async {
    await tester.pumpWidget(
      CupertinoApp(
        home: CupertinoButton(
          onPressed: () {},
          child: const Text('Test'),
        ),
      ),
    );
    expect(find.byType(CupertinoButton), findsOneWidget);
  });

  testWidgets('CupertinoNavigationBar renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const CupertinoApp(
        home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Title'),
          ),
          child: SizedBox.shrink(),
        ),
      ),
    );
    expect(find.byType(CupertinoNavigationBar), findsOneWidget);
  });

  testWidgets('CupertinoSwitch renders and toggles', (WidgetTester tester) async {
    var value = false;

    await tester.pumpWidget(
      CupertinoApp(
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return CupertinoSwitch(
              value: value,
              onChanged: (bool newValue) {
                setState(() {
                  value = newValue;
                });
              },
            );
          },
        ),
      ),
    );

    expect(value, isFalse);
    await tester.tap(find.byType(CupertinoSwitch));
    await tester.pump();
    expect(value, isTrue);
  });
}

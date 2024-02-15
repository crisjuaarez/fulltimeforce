import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_app/src/features/intro/intro_screen.dart';

void main() {
  Widget mainWidget() => const MaterialApp(home: IntroScreen());

  testWidgets('All components renderized', (widgetTester) async {
    await widgetTester.pumpWidget(mainWidget());
    expect(find.byKey(const Key('welcome_image')), findsOneWidget);
    expect(find.byKey(const Key('welcome_text')), findsOneWidget);
    expect(find.byKey(const Key('get_started_button')), findsOneWidget);
  });
}

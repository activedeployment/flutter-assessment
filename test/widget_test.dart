// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterassessment/main.dart';
import 'package:flutterassessment/common/common_functions.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('Test findLargestSmallest function', () {
    List<num> sampleArray = [900, -28, 9, 10, 13, 100, -50];

    CommonFunctions cf = new CommonFunctions();
    Map<String, num?> resultantMap = cf.findLargestSmallest(sampleArray);

    print(resultantMap);

    expect(resultantMap['smallestNumber'], -50);
    expect(resultantMap['largestNumber'], 900);

    // expect(counter.value, 1);
  });

  test('Test removeDuplicateCharacters function', () {
    String sampleString = 'anagram';

    CommonFunctions cf = new CommonFunctions();
    String resultantString = cf.removeDuplicateCharacters(sampleString);

    String resultantStringSecond = cf.removeDuplicateCharactersStringBuffer(sampleString);

    print(resultantString);

    print(resultantStringSecond);

    expect(resultantString, 'angrm');

    expect(resultantStringSecond, 'angrm');

    // expect(counter.value, 1);
  });

  test('Test areTwoStringsAnAnagram function', () {
    String sampleString = 'anagram';
    String sampleStringSecond = 'angaram';

    CommonFunctions cf = new CommonFunctions();
    bool resultantBool = cf.areTwoStringsAnAnagram(sampleString, sampleStringSecond);

    print(resultantBool);

    expect(resultantBool, true);

    // expect(counter.value, 1);
  });

  test('Test findAPhoneNumberUsingRegex function', () {
    String sampleText = 'jaiosjdifoa 61 4 0000 0000 sdfasd0499990000';

    CommonFunctions cf = new CommonFunctions();
    List<String> matches = cf.findAPhoneNumberUsingRegex(sampleText);

    print(matches);

    expect(matches[1], "0499990000");
    expect(matches[2], "61 4 0000 0000");

    // expect(counter.value, 1);
  });


}

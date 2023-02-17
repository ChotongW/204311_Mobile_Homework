import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'genshin_characters_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
// Define a test. The TestWidgets function also provides a WidgetTester
// to work with. The WidgetTester allows you to build and interact
// with widgets in the test environment.
  // testWidgets('CharacterList should display CircularProgressIndicator',
  //     (tester) async {
  //   final client = MockClient();
  //   when(client.get(Uri.parse('https://api.genshin.dev/characters')))
  //       .thenAnswer((_) async => Future.delayed(
  //           const Duration(seconds: 1),
  //           () => http.Response(
  //               '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
  //               200)));
  //   await tester.pumpWidget(MaterialApp(home: CharacterList(client: client)));
  //   await tester.pumpAndSettle();
  //   final findListView = find.byType(CircularProgressIndicator);
  //   expect(findListView, findsOneWidget);
  // });

  testWidgets('CharacterList should display a list of characters',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
    await tester.pumpWidget(MaterialApp(home: CharacterList(client: client)));
    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    expect(findListView, findsOneWidget);
  });
}

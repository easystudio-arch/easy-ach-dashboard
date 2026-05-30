import 'package:flutter_test/flutter_test.dart';
import 'package:english_offline/main.dart';

void main() {
  testWidgets('App renders home screen', (tester) async {
    await tester.pumpWidget(const EnglishApp());
    expect(find.text('English B2 Mastery'), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:avaliacao_9/main.dart';

void main() {
  testWidgets('exibe a tela inicial do aplicativo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RestApiApp());

    expect(find.text('Posts da API'), findsOneWidget);
  });
}

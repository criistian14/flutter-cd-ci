import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_ci_cd/features/shared/shared.dart';
import 'package:flutter_ci_cd/injection/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

class MockRouterCubit extends MockCubit<GoRouter> implements RouterCubit {}

void main() {
  group('App', () {
    setUpAll(() {
      sl.registerFactory(RouterCubit.new);
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}

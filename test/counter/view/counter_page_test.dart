import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ci_cd/features/counter/counter.dart';
import 'package:flutter_ci_cd/injection/injection_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
    sl.allowReassignment = true;
    sl.registerFactory(() => counterCubit);
  });

  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      when(() => counterCubit.state).thenReturn(0);

      await tester.pumpApp(const CounterPage());
      await tester.pumpAndSettle();
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}

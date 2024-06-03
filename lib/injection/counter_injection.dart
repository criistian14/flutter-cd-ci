part of 'injection_container.dart';

Future<void> initCounterInjection() async {
  sl.registerFactory(CounterCubit.new);
}

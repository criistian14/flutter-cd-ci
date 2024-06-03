part of 'injection_container.dart';

Future<void> initSharedInjection() async {
  sl.registerFactory(RouterCubit.new);
}

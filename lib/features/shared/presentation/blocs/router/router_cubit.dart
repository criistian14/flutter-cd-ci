import 'package:animations/animations.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_ci_cd/features/counter/counter.dart';
import 'package:flutter_ci_cd/features/shared/shared.dart';
import 'package:go_router/go_router.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_appRoutes);

  void goBack<T extends Object?>([T? result]) {
    state.pop<T>(result);
  }

  Future<T?> goPage<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return state.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}

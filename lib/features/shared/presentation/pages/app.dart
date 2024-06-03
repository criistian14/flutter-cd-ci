import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ci_cd/features/shared/shared.dart';
import 'package:flutter_ci_cd/injection/injection_container.dart';
import 'package:flutter_ci_cd/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RouterCubit>(),
      child: const _AppWithProviders(),
    );
  }
}

class _AppWithProviders extends StatelessWidget {
  const _AppWithProviders();

  @override
  Widget build(BuildContext context) {
    final router = context.watch<RouterCubit>();

    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router.state,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/features/counter/counter.dart';
import 'package:flutter_ci_cd/features/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => context.goPage(CounterPage.routeName),
            child: const Text('Go To Counter'),
          ),
        ),
      ),
    );
  }
}

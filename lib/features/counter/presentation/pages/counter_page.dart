import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ci_cd/features/counter/counter.dart';
import 'package:flutter_ci_cd/injection/injection_container.dart';
import 'package:flutter_ci_cd/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  static const routeName = '/counter';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CounterCubit>(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: CounterText(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: const Key('increment'),
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ).animate().fadeIn().scale().slideY(begin: -1),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: const Key('decrement'),
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ).animate().fadeIn().scale().slideY(begin: 1),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);

    return Text('$count', style: theme.textTheme.displayLarge)
        .animate(key: Key(count.toString()))
        .fadeIn(duration: 600.milliseconds)
        .slideY(duration: 300.milliseconds);
  }
}

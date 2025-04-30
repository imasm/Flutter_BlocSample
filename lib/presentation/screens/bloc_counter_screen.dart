import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(), child: const _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  // Increment the counter by the specified value
  increment(BuildContext context, int incrementValue) {
    context.read<CounterBloc>().increment(incrementValue);
  }

  reset(BuildContext context) {
    context.read<CounterBloc>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh_outlined), onPressed: () => reset(context)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.select(
              (CounterBloc counterBloc) => Text(
                "transactions: ${counterBloc.state.transactionCount}",
                style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),

            context.select(
              (CounterBloc counterBloc) => Text(
                'Counter Value: ${counterBloc.state.counter}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => increment(context, 1),
              child: const Text('Increment + 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => increment(context, 2),
              child: const Text('Increment + 2'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => increment(context, 3),
              child: const Text('Increment + 3'),
            ),
          ],
        ),
      ),
    );
  }
}

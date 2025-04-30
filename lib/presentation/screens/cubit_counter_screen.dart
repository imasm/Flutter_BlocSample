import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterCubit(), child: const _CubitCounterView());
  }
}

// Screen view
class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  // Increment the counter by the specified value
  increment(BuildContext context, int incrementValue) {
    context.read<CounterCubit>().increment(incrementValue);
  }

  reset(BuildContext context) {
    context.read<CounterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    //final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh_outlined), onPressed: () => reset(context)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Transaccions
            context.select(
              (CounterCubit cubit) => Text(
                "transactions: ${cubit.state.transactionCount}",
                style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),

            // Counter value
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                //print("Canvi del counter");
                return Text('Counter Value: ${state.counter}', style: TextStyle(fontSize: 30));
              },
            ),
            const SizedBox(height: 20),

            // Buttons
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

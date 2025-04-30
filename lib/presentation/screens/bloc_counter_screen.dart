import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.refresh_outlined), onPressed: () => {})],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value: xxx', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Increment + 1')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Increment + 2')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Increment + 3')),
          ],
        ),
      ),
    );
  }
}

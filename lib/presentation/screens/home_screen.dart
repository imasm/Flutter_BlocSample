import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Gestor d'estats simple"),
            onTap: () => {context.push('/cubits')},
          ),
        ],
      ),
    );
  }
}

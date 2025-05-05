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

          // BLoC
          ListTile(
            title: const Text('BLoC'),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Gestor d'estats simple"),
            onTap: () => {context.push('/bloc')},
          ),

          const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Divider()),

          // BLoC
          ListTile(
            title: const Text('Nou Usuari'),
            trailing: const Icon(Icons.arrow_forward_ios),
            subtitle: const Text("Contolador de formularis"),
            onTap: () => {context.push('/register')},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New User'), centerTitle: true),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FlutterLogo(size: 100),
              const SizedBox(height: 20),
              BlocProvider(create: (context) => RegisterCubit(), child: const _RegisterForm()),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          // Username
          CustomTextFormField(
            label: 'Username',
            onChanged: registerCubit.updateUsername,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10),

          // Email
          CustomTextFormField(
            label: 'Correu electrònic',
            onChanged: registerCubit.updateEmail,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10),

          // Password
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.updatePassword,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 20),

          // Confirm Password
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: Text('Nuevo usuari'),
          ),
        ],
      ),
    );
  }
}

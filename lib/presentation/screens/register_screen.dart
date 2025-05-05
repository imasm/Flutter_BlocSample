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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty || value.trim().isEmpty;
  }

  bool isEmailValid(String? value) {
    if (isNullOrEmpty(value)) return false;
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value!);
  }

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) {
              registerCubit.updateUsername(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (isNullOrEmpty(value)) {
                return 'El nom d\'usuari no pot estar buit';
              } else if (value!.length < 3) {
                return 'El nom d\'usuari ha de tenir més de 3 caràcters';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correu electrònic',
            onChanged: (value) {
              registerCubit.updateEmail(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (isNullOrEmpty(value)) {
                return 'El correu electrònic no pot estar buit';
              } else if (!isEmailValid(value)) {
                return 'El correu electrònic no és vàlid';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) {
              registerCubit.updatePassword(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (isNullOrEmpty(value)) {
                return 'La contrasenya no pot estar buida';
              } else if (value!.length < 6) {
                return 'La contrasenya ha de tenir com a mínim 6 caràcters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState?.validate();
              if (!isValid!) return;
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

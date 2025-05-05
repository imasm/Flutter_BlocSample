import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());
  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void onSubmit() {
    print('Submitting form with: $state');
  }
}

/// --------------------------------------------------
/// RegisterState
/// --------------------------------------------------
class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  final String username;
  final String email;
  final String password;
  final FormStatus formStatus;

  @override
  List<Object> get props => [username, email, password, formStatus];

  RegisterFormState copyWith({
    String? username,
    String? email,
    String? password,
    FormStatus? formStatus,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  bool get isValid => formStatus == FormStatus.valid;
}

enum FormStatus { invalid, valid, validating, posting }

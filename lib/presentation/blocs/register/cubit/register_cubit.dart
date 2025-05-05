import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());
  void updateUsername(String username) {
    final usernameInput = UsernameInput.dirty(value: username);
    emit(
      state.copyWith(
        username: usernameInput,
        isValid: Formz.validate([usernameInput, state.password, state.email]),
      ),
    );
  }

  void updateEmail(String email) {
    final emailInput = EmailInput.dirty(value: email);
    emit(
      state.copyWith(
        email: emailInput,
        isValid: Formz.validate([emailInput, state.password, state.username]),
      ),
    );
  }

  void updatePassword(String password) {
    final passwordValue = PasswordInput.dirty(value: password);
    emit(
      state.copyWith(
        password: passwordValue,
        isValid: Formz.validate([passwordValue, state.username, state.email]),
      ),
    );
  }

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: UsernameInput.dirty(value: state.username.value),
        email: EmailInput.dirty(value: state.email.value),
        password: PasswordInput.dirty(value: state.password.value),
      ),
    );

    print('Submitting form with: $state');
  }
}

/// --------------------------------------------------
/// RegisterState
/// --------------------------------------------------
class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
  });

  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;
  final FormStatus formStatus;
  final bool isValid;

  @override
  List<Object> get props => [username, email, password, formStatus];

  RegisterFormState copyWith({
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
    FormStatus? formStatus,
    bool? isValid,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
    );
  }
}

enum FormStatus { invalid, valid, validating, posting }

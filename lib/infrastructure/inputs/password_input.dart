import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, lengthTooShort }

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.lengthTooShort;
    return null; // Input is valid
  }

  String? get errorMessage {
    if (isValid || isPure) return null; // No error message needed for valid or pure state
    switch (error) {
      case PasswordInputError.empty:
        return 'La contrasenya no pot estar buida';
      case PasswordInputError.lengthTooShort:
        return 'La contrasenya ha de tenir almenys 6 caràcters';
      default:
        return null;
    }
  }
}

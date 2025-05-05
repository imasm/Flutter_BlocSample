import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, lengthTooShort }

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.lengthTooShort;
    return null; // Input is valid
  }

  String? get errorMessage {
    if (isValid || isPure) return null; // No error message needed for valid or pure state
    switch (error) {
      case UsernameInputError.empty:
        return 'El nom d\'usuari no pot estar buit';
      case UsernameInputError.lengthTooShort:
        return 'El nom d\'usuari ha de tenir almenys 6 caràcters';
      default:
        return null;
    }
  }
}

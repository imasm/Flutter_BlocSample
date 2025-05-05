import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, invalidFormat }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  static RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;

    if (!emailRegex.hasMatch(value)) {
      return EmailInputError.invalidFormat;
    }
    return null; // Input is valid
  }

  String? get errorMessage {
    if (isValid || isPure) return null; // No error message needed for valid or pure state
    switch (error) {
      case EmailInputError.empty:
        return 'El correu electrònic no pot estar buit';
      case EmailInputError.invalidFormat:
        return 'El format del correu electrònic no és vàlid';
      default:
        return null;
    }
  }
}

import 'package:tp_cours/src/validators/string_validators.dart';

mixin AuthSignInFormValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordSubmitValidator = NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty ? 'Email can\'t be empty' : 'Invalid email';
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    const String errorText = 'Password can\'t be empty';
    return showErrorText ? errorText : null;
  }
}

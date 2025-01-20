import 'package:smart_eco_mobile/utils/app_text.dart';
import 'package:validators/validators.dart';

String? nonEmptyStringValidator(String? value) {
  if (value == null || value.isEmpty) {
    return AppText.fieldCannotBeEmpty;
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return AppText.fieldCannotBeEmpty;
  }
  if (!isEmail(value)) {
    return AppText.invalidEmail;
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return AppText.fieldCannotBeEmpty;
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one  \n uppercase letter';
  }

  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value == null || value.isEmpty) {
    return AppText.fieldCannotBeEmpty;
  }
  if (value != password) {
    return 'Password does not match';
  }
  return null;
}

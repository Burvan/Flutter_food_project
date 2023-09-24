import 'package:core_ui/core_ui.dart';

class FieldValidator {
  static String? emailValidator(String? value) {
    if (value!.length < 5 || !value.contains('@') || !value.contains('.')) {
      return AppString.invalidEmailFormat;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.length < 6) {
      return AppString.invalidPassword;
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.length < 5) {
      return AppString.invalidNameFormat;
    } else {
      return null;
    }
  }
}

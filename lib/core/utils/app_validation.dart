class AppValidator {

  static String? phoneValidate(String? value) {
    final phoneRegExp = RegExp(r'^\+?\d{8,14}$');
    if (value == null || !phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || !emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? passwordValidate(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? nameValidate(String? value) {
    if (value == null || value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? dateValidate(String? value) {
    try {
      DateTime.parse(value ?? '');
      return null;
    } catch (e) {
      return 'Invalid date format';
    }
  }

  static String? numberValidate(String? value) {
    if ((double.tryParse(value ?? '') ?? -1) < 0) {
      return 'Invalid number';
    }
    return null;
  }
}

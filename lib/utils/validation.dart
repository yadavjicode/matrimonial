class Validation {
  static String? validateEmail(String? value) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (value == null || value.isEmpty) {
      return 'Please enter a email address';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePhoneno(String? value) {
    final phoneRegExp = RegExp(r'^\+?1?\d{10,10}$');

    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  static String? validateEmailPhone(String? value) {
    final phoneRegExp = RegExp(r'^\+?1?\d{10,10}$');
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (value == null || value.isEmpty) {
      return 'Please enter a phone number or email address';
    } else if (!phoneRegExp.hasMatch(value) && !emailRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number or email address';
    }

    return null;
  }
}

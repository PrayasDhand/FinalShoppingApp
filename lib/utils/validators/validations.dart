class TValidator {

  static String? validateEmptyText(String? fieldName, String? value){
    if (value== null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  // Validate email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  // Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6 || value.length > 15) {
      return 'Password must be between 6 and 12 characters.';
    }
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'\d').hasMatch(value);
    final hasSpecialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!hasLowercase) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!hasDigit) {
      return 'Password must contain at least one number.';
    }
    if (!hasSpecialCharacter) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  // Validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number.';
    }
    return null;
  }

  // Validate first name
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name is required.';
    }
    if (value.length < 2) {
      return 'First name must be at least 2 characters long.';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'First name should only contain letters.';
    }
    return null;
  }

  // Validate last name
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name is required.';
    }
    if (value.length < 2) {
      return 'Last name must be at least 2 characters long.';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Last name should only contain letters.';
    }
    return null;
  }
}

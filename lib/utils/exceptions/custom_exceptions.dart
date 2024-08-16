// lib/utils/exceptions/custom_exceptions.dart

class TFirebaseAuthException implements Exception {
  final String message;

  TFirebaseAuthException(String code) : message = _getAuthErrorMessage(code);

  static String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'No user corresponding to the given email.';
      case 'wrong-password':
        return 'The password is invalid for the given email.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}

class TFirebaseException implements Exception {
  final String message;

  TFirebaseException(String code) : message = _getFirebaseErrorMessage(code);

  static String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'An unknown Firebase error occurred.';
    }
  }
}

class TFormatException implements Exception {
  final String message = 'The format of the input is invalid.';

  const TFormatException();
}

class TPlatformException implements Exception {
  final String message;

  TPlatformException(String code) : message = _getPlatformErrorMessage(code);

  static String _getPlatformErrorMessage(String code) {
    switch (code) {
      case 'ERROR_NO_INTERNET':
        return 'No internet connection. Please try again.';
      case 'ERROR_TIMEOUT':
        return 'The connection has timed out. Please try again.';
      default:
        return 'An unknown platform error occurred.';
    }
  }
}
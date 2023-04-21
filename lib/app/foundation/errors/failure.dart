import 'package:camp_finder/app/core/constants/errors_messages.dart';

abstract class Failure implements Exception {
  final String? message;
  Failure({required this.message}) {
    if (this.message != null && this.message!.isNotEmpty) {
      print('>>Failure: $message');
    }
  }
}

class AuthException extends Failure {
  static const String WEAK_PASS_STATUS = 'weak-password';
  static const String EMAIL_IN_USE_STATUS = 'email-already-in-use';
  static const String USER_NOT_FOUND_STATUS = 'user-not-found';
  static const String WRONG_PASSWORD_STATUS = 'wrong-password';

  AuthException({required String message}) : super(message: message);

  static Failure getFailureFromAuth({
    String? statusCode = '',
  }) {
    switch (statusCode) {
      case WEAK_PASS_STATUS:
        return AuthException(message: ErrorMessages.PASSWORD_ERROR);
      case EMAIL_IN_USE_STATUS:
        return AuthException(message: ErrorMessages.EMAIL_IN_USE);
      case USER_NOT_FOUND_STATUS:
        return AuthException(message: ErrorMessages.USER_NOT_FOUND);
      case WRONG_PASSWORD_STATUS:
        return AuthException(message: ErrorMessages.PASSWORD_WRONG);
      default:
        return UnknownFailure(
          message: ErrorMessages.UNKNOWN_FAILURE,
        );
    }
  }
}

class UnknownFailure extends Failure {
  @override
  UnknownFailure({String? message: ErrorMessages.UNKNOWN_FAILURE})
      : super(message: message);
}

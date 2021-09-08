import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpResponse {
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}

parseStringToSignUpError(String text) {
  switch (text) {
    case "too-many-request":
      return SignUpError.tooManyRequest;
    case "email-already-in-use":
      return SignUpError.emailAlreadyInUse;
    case "weak-password":
      return SignUpError.weakPassword;
    case "network-request-failed":
      return SignUpError.networkRequestFailed;
    default:
      return SignUpError.unknown;
  }
}

enum SignUpError {
  tooManyRequest,
  emailAlreadyInUse,
  weakPassword,
  unknown,
  networkRequestFailed,
}

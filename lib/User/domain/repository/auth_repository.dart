import 'package:diagro/User/domain/responses/reset_password_response.dart';
import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<SignInResponse> signInWithGoogle();

  Future<SignInResponse> signInWithFacebook();
  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}

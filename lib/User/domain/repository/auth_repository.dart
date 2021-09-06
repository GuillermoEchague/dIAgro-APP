import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPssword(
    String email,
    String password,
  );
}

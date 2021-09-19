import 'package:diagro/User/data/repositories_impl/account_repository_impl.dart';
import 'package:diagro/User/data/repositories_impl/auth_repository_impl.dart';
import 'package:diagro/User/data/repositories_impl/preferences_repository_impl.dart';
import 'package:diagro/User/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:diagro/User/domain/repository/account_repository.dart';
import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/domain/repository/preferences_repository.dart';
import 'package:diagro/User/domain/repository/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDependencies() async {
  final preferences = await SharedPreferences.getInstance();
  Get.i.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
      facebookAuth: FacebookAuth.i,
    ),
  );

  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<PreferencesRepository>(
    () => PreferencesRepositoryImpl(preferences),
  );
}

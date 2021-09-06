import 'package:diagro/User/data/repositories_impl/auth_repository_impl.dart';
import 'package:diagro/User/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/domain/repository/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(FirebaseAuth.instance),
  );

  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
}

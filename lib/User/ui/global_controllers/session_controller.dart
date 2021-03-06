import 'package:diagro/User/domain/repository/account_repository.dart';
import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final AuthRepository _auth = Get.i.find();
  final AccountRepository _account = Get.i.find();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<User?> updateDisplayName(String value) async {
    final user = await _account.updateDisplayName(value);
    if (user != null) {
      _user = user;
      notify();
    }
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
  }
}

final sessionProider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);

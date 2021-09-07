import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = '';
  final _authRepository = Get.i.find<AuthRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() {
    return _authRepository.signInWithEmailAndPssword(
      _email,
      _password,
    );
  }
}

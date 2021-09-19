import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = '', _password = '';
  final _authRepository = Get.i.find<AuthRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> signInWithEmailAndPassword() async {
    final response = await _authRepository.signInWithEmailAndPassword(
      _email,
      _password,
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  Future<SignInResponse> signInWithGoogle() async {
    final response = await _authRepository.signInWithGoogle();
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  Future<SignInResponse> signInWithFacebook() async {
    final response = await _authRepository.signInWithFacebook();
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}

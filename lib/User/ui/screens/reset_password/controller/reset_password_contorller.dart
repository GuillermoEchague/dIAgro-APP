import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/domain/responses/reset_password_response.dart';
import 'package:flutter_meedu/meedu.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';
  String get email => _email;

  final _authenticationRepository = Get.i.find<AuthRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<ResetPasswordResponse> submit() {
    return _authenticationRepository.sendResetPasswordLink(email);
  }
}

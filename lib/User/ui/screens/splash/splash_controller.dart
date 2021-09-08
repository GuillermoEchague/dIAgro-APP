import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final AuthRepository _authRepository = Get.i.find();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.LOGIN;
    }

    notify();
  }
}

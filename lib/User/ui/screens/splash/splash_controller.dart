import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final _authRepository = Get.i.find<AuthRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    _routeName = user != null ? Routes.HOME : Routes.LOGIN;
    notify();
  }
}

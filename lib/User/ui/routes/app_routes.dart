import 'package:diagro/User/ui/screens/home/home_page.dart';
import 'package:diagro/User/ui/screens/login/login_page.dart';
import 'package:diagro/User/ui/screens/register/register_page.dart';
import 'package:diagro/User/ui/screens/reset_password/reset_password_page.dart';
import 'package:diagro/User/ui/screens/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

import 'routes.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.HOME: (_) => const HomePage(),
      Routes.REGISTER: (_) => const RegisterPage(),
      Routes.RESET_PASSWORD: (_) => const ResetPasswordPage(),
    };

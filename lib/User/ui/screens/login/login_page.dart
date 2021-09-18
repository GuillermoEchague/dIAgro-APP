import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/screens/login/utils/send_login_form.dart';
import 'package:diagro/User/ui/widgets/custom_input_field.dart';
import 'package:diagro/User/ui/widgets/rounded_button.dart';
import 'package:diagro/User/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'controller/login_controller.dart';
import 'widgets/login_form.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: OrientationBuilder(
            builder: (_, orientation) {
              if (orientation == Orientation.portrait) {
                return LoginForm();
              }
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LoginForm(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/screens/login/utils/send_login_form.dart';
import 'package:diagro/User/ui/widgets/custom_input_field.dart';
import 'package:diagro/User/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';

import 'controller/login_controller.dart';

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
          body: SafeArea(
              child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomInputField(
                      label: "Email",
                      onChanged: controller.onEmailChanged,
                      inputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (isValidEmail(text!)) {
                          return null;
                        }
                        return "Invalid email";
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInputField(
                      label: "Password",
                      onChanged: controller.onPasswordChanged,
                      isPassword: true,
                      validator: (text) {
                        if (text!.trim().length >= 6) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () =>
                              router.pushNamed(Routes.RESET_PASSWORD),
                          child: const Text("Forgot Password?"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              elevation: MaterialStateProperty.all(7),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                          onPressed: () => sendLoginForm(context),
                          child: const Text("Sign In"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                        ),
                        TextButton(
                          onPressed: () => router.pushNamed(Routes.REGISTER),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}

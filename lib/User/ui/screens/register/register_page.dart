import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/screens/register/controller/register_controller.dart';
import 'package:diagro/User/ui/screens/register/controller/register_state.dart';
import 'package:diagro/User/ui/screens/register/utils/send_register_form.dart';
import 'package:diagro/User/ui/widgets/custom_input_field.dart';
import 'package:diagro/User/ui/widgets/rounded_button.dart';
import 'package:diagro/User/utils/email_validator.dart';
import 'package:diagro/User/utils/name_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
    );
    final padding = context.mediaQueryPadding;
    final height = context.height -
        padding.top -
        padding.bottom -
        appBar.preferredSize.height;

    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: ListView(
            children: [
              SizedBox(
                height: height,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomInputField(
                            label: "Name",
                            onChanged: controller.onNameChanged,
                            validator: (text) {
                              return isValidName(text!) ? null : "invalid name";
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomInputField(
                            label: "Last Name",
                            onChanged: controller.onLastNameChanged,
                            validator: (text) {
                              return isValidName(text!)
                                  ? null
                                  : "invalid last name";
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomInputField(
                            label: "E-mail",
                            inputType: TextInputType.emailAddress,
                            onChanged: controller.onEmailChanged,
                            validator: (text) {
                              return isValidEmail(text!)
                                  ? null
                                  : "invalid email";
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomInputField(
                            label: "Password",
                            onChanged: controller.onPasswordChanged,
                            isPassword: true,
                            validator: (text) {
                              if (text!.trim().length >= 6) {
                                return null;
                              }
                              return "invalid password";
                            },
                          ),
                          const SizedBox(height: 15),
                          Consumer(
                            builder: (_, watch, __) {
                              watch(registerProvider.select((_) => _.password));
                              return CustomInputField(
                                label: "Verification Password",
                                onChanged: controller.onVPasswordChanged,
                                isPassword: true,
                                validator: (text) {
                                  if (controller.state.password != text) {
                                    return "password don't match";
                                  }
                                  if (text!.trim().length >= 6) {
                                    return null;
                                  }

                                  return "invalid password";
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          RoundedButton(
                            text: "REGISTER",
                            onPressed: () => sendRegisterForm(context),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:diagro/User/domain/responses/reset_password_response.dart';
import 'package:diagro/User/ui/screens/reset_password/controller/reset_password_contorller.dart';
import 'package:diagro/User/ui/widgets/custom_input_field.dart';
import 'package:diagro/User/ui/widgets/dialogs/dialogs.dart';
import 'package:diagro/User/ui/widgets/dialogs/progress_dialog.dart';
import 'package:diagro/User/ui/widgets/rounded_button.dart';
import 'package:diagro/User/utils/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/src/utils/screen_utils.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';

final resetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;
    return ProviderListener<ResetPasswordController>(
      provider: resetPasswordProvider,
      builder: (_, controller) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(
              height: height,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Align(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 360,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: SvgPicture.asset(
                              'assets/pages/login/icons/images/my_password.svg',
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Reset Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomInputField(
                            label: "Email",
                            onChanged: controller.onEmailChanged,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              "Enter your email to recive a link to change your password"),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: RoundedButton(
                              onPressed: () => _submit(context),
                              text: "Send",
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) async {
    final controller = resetPasswordProvider.read;
    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if (response == ResetPasswordResponse.ok) {
        Dialogs.alert(
          context,
          title: "GOOD",
          content: "Email sent",
        );
      } else {
        String errorMessage = "";
        switch (response) {
          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = "network Request Failed";
            break;
          case ResetPasswordResponse.userDisabled:
            errorMessage = "user Disabled";
            break;
          case ResetPasswordResponse.userNotFound:
            errorMessage = "user Not Found";
            break;
          case ResetPasswordResponse.tooManyRequests:
            errorMessage = "too Many Requests";
            break;
          case ResetPasswordResponse.unknown:
            errorMessage = "unknown error";
            break;
        }

        Dialogs.alert(
          context,
          title: "ERROR",
          content: errorMessage,
        );
      }
    } else {
      Dialogs.alert(context, content: "Invalid email");
    }
  }
}

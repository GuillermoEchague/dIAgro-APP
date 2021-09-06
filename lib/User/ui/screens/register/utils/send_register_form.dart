import 'package:diagro/User/domain/responses/sign_up_response.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/widgets/dialogs/dialogs.dart';
import 'package:diagro/User/ui/widgets/dialogs/progress_dialog.dart';

import '../register_page.dart' show registerProvider;
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();

    if (response.error != null) {
      late String content;

      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "email already in use";
          break;
        case SignUpError.weakPassword:
          content = "weak password";
          break;
        case SignUpError.networkRequestFailed:
          content = "network Request Failed";
          break;

        case SignUpError.unknown:
        default:
          content = "unknown error";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(
      context,
      title: "ERROR",
      content: "Invalid fields",
    );
  }
}

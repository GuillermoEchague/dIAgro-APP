import 'package:diagro/User/ui/widgets/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';
import 'handle_login_response.dart';

void signInWithFacebook(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithFacebook();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}

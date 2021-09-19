import 'package:diagro/User/domain/responses/sign_in_response.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

void handleLoginResponse(BuildContext context, SignInResponse response) {
  if (response.error != null) {
    String errorMessage = "";

    if (response.error != SignInError.cancelled) {
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "network Request Failed";
          break;
        case SignInError.userDisabled:
          errorMessage = "user Disabled";
          break;
        case SignInError.userNotFound:
          errorMessage = "user Not Found";
          break;
        case SignInError.wrongPassword:
          errorMessage = "wrong Password";
          break;
        case SignInError.tooManyRequest:
          errorMessage = "too Many Request";
          break;

        case SignInError.invalidCredential:
          errorMessage = "invalid Credential";
          break;
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = response.providerId ?? "Invalid auth method";
          break;

        case SignInError.unknown:
        default:
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
    router.pushReplacementNamed(
      Routes.HOME,
    );
  }
}

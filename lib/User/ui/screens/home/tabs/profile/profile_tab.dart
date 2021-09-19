import 'package:diagro/User/my_app.dart';
import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/screens/home/tabs/profile/widgets/label_button.dart';
import 'package:diagro/User/ui/widgets/dialogs/dialogs.dart';
import 'package:diagro/User/ui/widgets/dialogs/progress_dialog.dart';
import 'package:diagro/User/ui/widgets/dialogs/show_input_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);
  void _updateDisplayName(BuildContext context) async {
    final sessionController = sessionProider.read;
    final value = await showInputDialog(
      context,
      initialValue: sessionController.user!.displayName ?? "",
    );
    if (value != null) {
      ProgressDialog.show(context);
      final user = await sessionController.updateDisplayName(value);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Check your internet connection",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProider);
    final theme = watch(themeProvider);
    final user = sessionController.user!;

    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : "";

    return ListView(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 75,
          child: user.photoURL == null
              ? Text(
                  letter,
                  style: const TextStyle(fontSize: 65),
                )
              : null,
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          displayName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(child: Text(user.email ?? '')),
        const SizedBox(
          height: 50,
        ),
        // const Text("User data"),
        LabelButton(
          label: "Display Name",
          value: displayName,
          onPressed: () => _updateDisplayName(context),
        ),
        LabelButton(
          label: "Email",
          value: user.email ?? '',
        ),
        LabelButton(
          label: "Email verified",
          value: user.emailVerified ? "YES" : "NO",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dark Mode"),
              CupertinoSwitch(
                value: theme.isDark,
                onChanged: (_) {
                  theme.toggle();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        LabelButton(
          label: "Sign Out",
          value: "",
          onPressed: () async {
            await sessionProider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ],
    );
  }
}

import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (_, watch, __) {
              final user = watch(sessionProider).user!;
              return Text(user.displayName ?? '');
            },
          ),
          const Text("HOME PAGE"),
          const SizedBox(height: 20),
          CupertinoButton(
            color: Colors.blue,
            child: const Text("Sign Out"),
            onPressed: () async {
              await sessionProider.read.signOut();
              router.pushNamedAndRemoveUntil(Routes.LOGIN);
            },
          )
        ],
      ),
    );
  }
}

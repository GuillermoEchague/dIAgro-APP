import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("HOME PAGE"),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blue,
              child: Text("Sign Out"),
              onPressed: () async {
                await Get.i.find<AuthRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}

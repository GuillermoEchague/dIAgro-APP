import 'package:diagro/User/domain/repository/auth_repository.dart';
import 'package:diagro/User/ui/global_controllers/session_controller.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:diagro/User/ui/screens/home/home_controller.dart';
import 'package:diagro/User/ui/screens/home/tabs/home/home_tab.dart';
import 'package:diagro/User/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:diagro/User/ui/screens/home/widgets/home_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

final HomeProvider = SimpleProvider(
  (_) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<HomeController>(
      provider: HomeProvider,
      builder: (_, controller) {
        return Scaffold(
          bottomNavigationBar: HomeTabBar(),
          body: SafeArea(
              child: TabBarView(
            controller: controller.tabController,
            children: const [
              HomeTab(),
              ProfileTab(),
            ],
          )),
        );
      },
    );
  }
}

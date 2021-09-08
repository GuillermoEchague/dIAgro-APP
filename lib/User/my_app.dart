import 'package:diagro/User/ui/global_controllers/theme_controller.dart';
import 'package:diagro/User/ui/routes/app_routes.dart';
import 'package:diagro/User/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      final theme = watch(themeProvider);
      return MaterialApp(
        title: 'dIAgro App',
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: theme.mode,
        navigatorObservers: [
          router.observer,
        ],
        routes: appRoutes,
      );
    });
  }
}

final themeProvider = SimpleProvider(
  (_) => ThemeController(),
  autoDispose: false,
);

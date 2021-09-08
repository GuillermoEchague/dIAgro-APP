import 'package:diagro/User/ui/global_controllers/theme_controller.dart';
import 'package:diagro/User/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({Key? key}) : super(key: key);
  final _homeController = HomeProvider.read;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Consumer(
        builder: (_, watch, __) {
          final isDark = watch(themeProvider).isDark;
          return TabBar(
            labelColor: Colors.greenAccent,
            indicator: _CustomIndicator(),
            unselectedLabelColor: isDark ? Colors.white : Colors.black26,
            tabs: const [
              Tab(
                icon: Icon(Icons.home_rounded),
              ),
              Tab(
                icon: Icon(Icons.person_rounded),
              ),
            ],
            controller: _homeController.tabController,
          );
        },
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter();
  }
}

class _CirclePainter extends BoxPainter {
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final size = configuration.size!;
    final paint = Paint();
    paint.color = Colors.green;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.8);
    canvas.drawCircle(center, 3, paint);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color backgroundColor;
  final VoidCallback onPressed;
  const CircleButton(
      {Key? key,
      this.size = 50,
      required this.backgroundColor,
      required this.onPressed,
      required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(iconPath, color: Colors.white),
          decoration:
              BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        ),
        onPressed: onPressed);
  }
}

import 'package:diagro/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  const RoundedButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.backgroundColor})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          child: Text(
            this.label,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'roboto',
                letterSpacing: 1,
                fontSize: 18),
          ),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          decoration: BoxDecoration(
              color: this.backgroundColor,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: this.onPressed);
  }
}

import 'package:diagro/User/ui/icons/meedu_icons.dart';
import 'package:diagro/User/ui/screens/login/utils/sign_in_with_faceook.dart';
import 'package:diagro/User/ui/screens/login/utils/sign_in_with_google.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          color: Colors.blueAccent,
          onPressed: () => signInWithFacebook(context),
          iconData: MeeduIcons.facebook,
        ),
        const SizedBox(
          width: 25,
        ),
        SocialButton(
          color: Colors.redAccent,
          onPressed: () => signInWithGoogle(context),
          iconData: MeeduIcons.google,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Color color;
  const SocialButton({
    Key? key,
    this.onPressed,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(50, 50),
        ),
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(iconData),
      ),
    );
  }
}

import 'package:diagro/User/ui/widgets/input_text_login.dart';
import 'package:diagro/libs/auth.dart';
import 'package:diagro/utils/responsive.dart';
import 'package:diagro/widgets/circle_button.dart';
import 'package:diagro/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      top: false,
      child: Container(
        // color: Colors.red,
        width: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const InputTextLogin(
                iconPath: 'assets/pages/login/icons/email.svg',
                placeholder: "Correo Electrónico"),
            SizedBox(
              height: responsive.ip(2),
            ),
            const InputTextLogin(
                iconPath: 'assets/pages/login/icons/key.svg',
                placeholder: "Contraseña"),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    "Olvido Contraseña",
                    style: TextStyle(fontFamily: 'roboto'),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: responsive.ip(2),
            ),
            RoundedButton(
              onPressed: () {},
              label: "Sign In",
              backgroundColor: const Color(0xff448AFF),
            ),
            SizedBox(
              height: responsive.ip(3.3),
            ),
            const Text("Continuar Con"),
            SizedBox(
              height: responsive.ip(1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                  size: 55,
                  iconPath: 'assets/pages/login/icons/facebook.svg',
                  backgroundColor: const Color(0xff448AFF),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 30,
                ),
                CircleButton(
                  size: 55,
                  iconPath: 'assets/pages/login/icons/google.svg',
                  backgroundColor: const Color(0xffFF1744),
                  onPressed: () async {
                    await Auth.instance.google(context);
                    // ignore: avoid_print
                    print("listo");
                  },
                )
              ],
            ),
            SizedBox(
              height: responsive.ip(2.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("¿No tienes una cuenta?"),
                CupertinoButton(
                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontFamily: 'roboto', fontWeight: FontWeight.w600)),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}

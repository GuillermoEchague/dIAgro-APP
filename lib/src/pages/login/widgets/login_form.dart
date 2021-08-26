import 'package:diagro/src/pages/login/widgets/input_text_login.dart';
import 'package:diagro/src/utils/responsive.dart';
import 'package:diagro/src/widgets/circle_button.dart';
import 'package:diagro/src/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

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
            InputTextLogin(
                iconPath: 'assets/pages/login/icons/email.svg',
                placeholder: "Correo Electrónico"),
            SizedBox(
              height: responsive.ip(2),
            ),
            InputTextLogin(
                iconPath: 'assets/pages/login/icons/key.svg',
                placeholder: "Contraseña"),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Olvido Contraseña",
                    style: TextStyle(fontFamily: 'roboto'),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: responsive.ip(2),
            ),
            RoundedButton(onPressed: () {}, label: "Sign In"),
            SizedBox(
              height: responsive.ip(3.3),
            ),
            Text("Continuar Con"),
            SizedBox(
              height: responsive.ip(1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                  size: 55,
                  iconPath: 'assets/pages/login/icons/facebook.svg',
                  backgroundColor: Color(0xff448AFF),
                ),
                SizedBox(
                  width: 30,
                ),
                CircleButton(
                  size: 55,
                  iconPath: 'assets/pages/login/icons/google.svg',
                  backgroundColor: Color(0xffFF1744),
                )
              ],
            ),
            SizedBox(
              height: responsive.ip(2.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("¿No tienes una cuenta?"),
                CupertinoButton(
                    child: Text("Sign Up",
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

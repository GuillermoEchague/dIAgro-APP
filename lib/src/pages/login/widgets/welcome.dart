import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return AspectRatio(
      aspectRatio: 16 / 11,
      child: LayoutBuilder(
        builder: (_, contraints) {
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage('assets/pages/login/fondo.jpg'),
                    width: contraints.maxWidth,
                  ),
                ),
                Positioned(
                  top: contraints.maxHeight * 0.6,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 3,
                        width: contraints.maxWidth,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "dIAgro",
                        style: TextStyle(
                            fontSize: responsive.ip(4),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'roboto',
                            color: Color(0xffeeeeee)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: contraints.maxHeight * 0.2,
                  right: contraints.maxWidth * 0.35,
                  child: SvgPicture.asset('assets/pages/login/lupa.svg',
                      width: contraints.maxWidth * 0.3),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

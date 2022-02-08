import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/shared/components/constants.dart';
import 'dart:math' as math;

Widget myTextField(
        {Function()? onTap,
        required TextEditingController? controller,
        Function(String)? onSubmit,
        String? Function(String?)? validator,
        Widget? label,
        Widget? prefix,
        Widget? suffix}) =>
    TextFormField(
      controller: controller,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      validator: validator,
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );

Widget myButton(
        {required Function() onPressed,
        Color color = Colors.green,
        Widget? widget,
        double? width,
        double? height}) =>
    MaterialButton(
      onPressed: onPressed,
      color: color,
      child: widget,
      minWidth: width,
      height: height,
    );

void goTo({required Widget widget, context}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
}

void goAndFinishTo({required Widget widget, required BuildContext context}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => widget));
}

void popTo({required BuildContext context}) {
  Navigator.of(context).pop();
}

Widget cardInfo(
        {required Size size,
        required String title,
        required String photoPath,
        required String subtitle}) =>
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: firstColor,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  width: size.width / 1.5,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: 10, sigmaY: 10, tileMode: TileMode.decal),
                    child: Image.asset('assets/images/UltraTech.jpg',
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 90, top: 10),
                        child: Text(
                          title,
                          style: GoogleFonts.blackOpsOne(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150, right: 25),
                        child: Wrap(
                          children: [
                            Text(
                              subtitle,
                              style: GoogleFonts.blackOpsOne(
                                  color: firstColor, height: 1.3),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  width: size.width,
                  height: size.height - 50,
                ),
              ],
            ),
            ClipPath(
              clipper: MyDivider(size),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          photoPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  width: size.width,
                  height: size.height,
                ),
              ),
            )
          ],
        ),
      ),
    );

class MyDivider extends CustomClipper<Path> {
  final Size screen;

  MyDivider(this.screen);

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width, screen.height);
    path.lineTo(size.width / 3, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

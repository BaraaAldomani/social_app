import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: firstColor,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  width: size.width / 1.0,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                        sigmaX: 10, sigmaY: 10, tileMode: TileMode.decal),
                    child: Image.asset('assets/images/UltraTech.jpg',
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
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
                        padding: const EdgeInsets.only(left: 160, right: 25),
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
                ),
              ],
            ),
            ClipPath(
              clipper: MyDivider(size),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        photoPath,
                        fit: BoxFit.contain,
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

Widget postInfo(
        {required Size size,
        required TextEditingController controller,
        String? image,
        String? content}) =>
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: firstColor.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            height: size.height / 11,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: size.width / 15,
                    backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/ogw/ADea4I5jQyTiwZ6bkD264_IPZ4zv5A_0fFK7EL8VG4cXpg=s32-c-mo'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Baraa Adomani',
                        style: GoogleFonts.blackOpsOne(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat.yMd().format(DateTime.now()),
                        style: GoogleFonts.blackOpsOne(
                          color: secondColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    color: secondColor,
                    iconSize: size.width / 13,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: firstColor.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  content != null
                      ? Wrap(
                          children: [
                            Text(
                              content,
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.blackOpsOne(
                                  color: secondColor, fontSize: 16),
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  image != null
                      ? Container(
                          height: size.height / 4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover)),
                        )
                      : Container(),
                  Container(
                      height: size.height / 30,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: size.width / 20,
                              ),
                              Text('2020',
                                  style: TextStyle(fontSize: size.width / 30))
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: firstColor.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            height: size.height / 11,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: size.width / 20,
                          backgroundImage: NetworkImage(
                              'https://lh3.googleusercontent.com/ogw/ADea4I5jQyTiwZ6bkD264_IPZ4zv5A_0fFK7EL8VG4cXpg=s32-c-mo'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: size.width / 3,
                            child: TextField(
                              controller: controller,
                              showCursor: false,
                              decoration: InputDecoration(
                                  hintText: 'Write comment...',
                                  hintStyle:
                                      TextStyle(fontSize: size.width / 30),
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.comment),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    color: secondColor,
                    iconSize: size.width / 13,
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: MyDivider(),
            child: Container(
              height: size.height * .3,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          Spacer(),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(math.pi),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: ClipPath(
                clipper: MyDivider(),
                child: Container(
                  height: size.height * .3,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: RPSCustomPainter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FloatingActionButton(
                      child: Icon(Icons.close),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyDivider extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 20, size.height / 3.5, size.width, size.height - 150);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = Colors.red;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5000500);
    path0.quadraticBezierTo(size.width * 0.0000375, size.height * 0.2542000,
        size.width * 0.0625000, size.height * 0.2500000);
    path0.cubicTo(
        size.width * 0.1562500,
        size.height * 0.2500000,
        size.width * 0.3417000,
        size.height * 0.0126000,
        size.width * 0.4354500,
        size.height * 0.0126000);
    path0.quadraticBezierTo(size.width * 0.4089875, size.height * 0.0142500,
        size.width * 0.4125000, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.4148500, size.height * 0.6500000,
        size.width * 0.4375000, size.height * 0.7500000);
    path0.cubicTo(
        size.width * 0.5000000,
        size.height * 0.8437500,
        size.width * 0.5574750,
        size.height * 0.7626000,
        size.width * 0.5625000,
        size.height * 0.7500000);
    path0.quadraticBezierTo(size.width * 0.5859375, size.height * 0.6625000,
        size.width * 0.5875000, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.5820000, size.height * 0.0138500,
        size.width * 0.5562375, size.height * 0.0125500);
    path0.cubicTo(
        size.width * 0.6499875,
        size.height * 0.0125500,
        size.width * 0.8437500,
        size.height * 0.2500000,
        size.width * 0.9375000,
        size.height * 0.2500000);
    path0.quadraticBezierTo(size.width * 0.9968500, size.height * 0.2542500,
        size.width, size.height * 0.5000000);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.5000500);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

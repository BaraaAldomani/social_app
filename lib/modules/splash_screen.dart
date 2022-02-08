import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  final String? uId;
  const SplashScreen({Key? key, required this.uId}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => goAndFinishTo(
            context: context,
            widget: widget.uId!.isEmpty ? LoginScreen() : SocialLayout()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.social_distance,
                size: MediaQuery.of(context).size.width / 7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ultra Media',
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 7),
              ),
            )
          ],
        ),
      ),
    );
  }
}

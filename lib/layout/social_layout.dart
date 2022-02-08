import 'package:flutter/material.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ultra Media',
          style: TextStyle(fontSize: size.width / 12),
        ),
        centerTitle: true,
      ),
    );
  }
}

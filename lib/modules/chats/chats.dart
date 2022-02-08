import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          child: Column(
            children: [],
          )),
    );
  }
}

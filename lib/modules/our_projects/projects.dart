import 'package:flutter/material.dart';
import 'package:social_app/shared/components/constants.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

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

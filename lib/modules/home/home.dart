import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/components/constants.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondColor,
      body: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: firstColor.withOpacity(0.5),
              ),
              BoxShadow(
                color: secondColor,
                offset: Offset(0, 15),
                spreadRadius: -5.0,
                blurRadius: 20.0,
              ),
            ],
            color: Colors.white10,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CarouselSlider(
                items: [
                  cardInfo(
                      photoPath: 'assets/images/BaraaDrkazlli.jpg',
                      size: size,
                      title: 'Developer&Designer',
                      subtitle:
                          'my name is baraa, and I\'m a back end developer and Designer\n Let\'s code...'),
                  cardInfo(
                      photoPath: 'assets/images/Omar.jpg',
                      size: size,
                      title: 'Developer',
                      subtitle:
                          'my name is omar, and I\'m a back end developer \n\n Let\'s code...'),
                  cardInfo(
                      photoPath: 'assets/images/BaraaAldomani.jpg',
                      size: size,
                      title: 'Developer & Inventor',
                      subtitle:
                          'my name is baraa, and I\'m Front-end Developer and   UI/UX Designer\n Let\'s code...'),
                  cardInfo(
                      photoPath: 'assets/images/ahmad.jpg',
                      size: size,
                      title: 'Developer',
                      subtitle:
                          'my name is baraa, and I\'m Front-end Developer and   UI/UX Designer\n Let\'s code...'),
                ],
                carouselController: CarouselControllerImpl(),
                options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    autoPlay: true,
                    initialPage: 0,
                    height: size.height / 4,
                    viewportFraction: 0.9,
                    autoPlayCurve: Curves.easeInOutCirc,
                    enlargeCenterPage: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

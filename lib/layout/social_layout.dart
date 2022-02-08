import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/network/local/cache_helper.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/components/constants.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {
          if (state is GetUserDataSuccessStates) {}
          if (state is SignOutSuccessStates) {
            goAndFinishTo(widget: LoginScreen(), context: context);
            CacheHelper.removeData(key: 'uId');
          }
        },
        builder: (context, state) {
          SocialCubit cubit = SocialCubit.get(context);
          return Scaffold(
            backgroundColor: secondColor,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: size.width / 6,
              actions: [
                IconButton(
                  onPressed: () {
                    SocialCubit.get(context).signOut();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: firstColor,
                  ),
                )
              ],
              leadingWidth: size.width / 5,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: firstColor,
                  child: CircleAvatar(
                    maxRadius: size.width / 18,
                    backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/ogw/ADea4I5jQyTiwZ6bkD264_IPZ4zv5A_0fFK7EL8VG4cXpg=s32-c-mo'),
                  ),
                ),
              ),
              title: Text(
                'Ultra Tech',
                style: TextStyle(fontSize: size.width / 12),
              ),
              centerTitle: true,
            ),
            body: Container(
              decoration: BoxDecoration(
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
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: firstColor,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.blackOpsOne(),
              selectedItemColor: secondColor,
              unselectedItemColor: secondColor.withOpacity(0.4),
              unselectedLabelStyle: GoogleFonts.blackOpsOne(),
              unselectedIconTheme: IconThemeData(
                color: secondColor.withOpacity(0.4),
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat_bubble,
                    ),
                    label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.work,
                    ),
                    label: 'Our Projects'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: 'Settings')
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}

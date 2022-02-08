import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
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
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              color: firstColor.withOpacity(0.6),
              child: SalomonBottomBar(
                items: [
                  SalomonBottomBarItem(
                    activeIcon: Icon(Icons.other_houses_sharp),
                    selectedColor: secondColor,
                    unselectedColor: firstColor,
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  SalomonBottomBarItem(
                    activeIcon: Icon(Icons.chat),
                    selectedColor: secondColor,
                    unselectedColor: firstColor,
                    icon: Icon(Icons.chat_bubble),
                    title: Text('Chats'),
                  ),
                  SalomonBottomBarItem(
                    activeIcon: Icon(Icons.work),
                    selectedColor: secondColor,
                    unselectedColor: firstColor,
                    icon: Icon(Icons.work),
                    title: Text('Our Projects'),
                  ),
                  SalomonBottomBarItem(
                    activeIcon: Icon(Icons.settings_outlined),
                    selectedColor: secondColor,
                    unselectedColor: firstColor,
                    icon: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeNavIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

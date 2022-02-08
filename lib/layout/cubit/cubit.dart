import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/layout/social_layout.dart';
import 'package:social_app/modules/our_projects/projects.dart';
import 'package:social_app/modules/settings/settings.dart';
import 'package:social_app/shared/components/constants.dart';

import '../../models/user_model.dart';
import '../../modules/chats/chats.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? model;
  void getUserData() {
    emit(GetUserDataLoadingStates());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      model = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessStates(model!));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorStates());
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut().then((value) {
      emit(SignOutSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SignOutErrorStates());
    });
  }

  int currentIndex = 0;
  void changeNavIndex(index) {
    currentIndex = index;
    emit(ChangeNavIndex());
  }

  List screens = [
    SocialLayout(),
    ChatsScreen(),
    SettingsScreen(),
    ProjectsScreen()
  ];
}

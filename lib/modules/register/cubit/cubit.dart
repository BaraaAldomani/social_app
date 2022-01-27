import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({required String email, required String password}) {
    emit(RegisterLoadingStates());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(RegisterSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }

  void createUser(
      {required String name,
      required String email,
      required String phone,
      required String uId}) {
    UserModel _model =
        UserModel(name: name, email: email, phone: phone, uId: uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(_model.toMap())
        .then((value) {
      emit(CreateUserSuccessStates());
    }).catchError((error) {
      emit(CreateUserErrorStates(error.toString()));
    });
  }
}

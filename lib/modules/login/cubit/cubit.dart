import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/login/cubit/states.dart';
import 'package:social_app/modules/register/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit( ) : super(LoginInitialStates());
  static LoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({required String email, required String password}){
    emit(LoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      print(value.user!.uid);
      emit(LoginSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorStates(error.toString()));
    });
  }
}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({required String email, required String password}) {
    emit(RegisterLoadingStates());
    print('aaaa');
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(RegisterSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorStates(error.toString()));
    });
  }
}

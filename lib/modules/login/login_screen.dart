import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/modules/login/cubit/cubit.dart';
import 'package:social_app/modules/login/cubit/states.dart';
import 'package:social_app/modules/register/register_screen.dart';
import 'package:social_app/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessStates) {
            Fluttertoast.showToast(
                msg: 'Login successfully',
                backgroundColor: Colors.green,
                gravity: ToastGravity.BOTTOM);
          }
          if (state is LoginErrorStates) {
            Fluttertoast.showToast(
                msg: state.error.split(']').last,
                backgroundColor: Colors.red,
                gravity: ToastGravity.BOTTOM);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 7,
                          color: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: myTextField(
                          controller: _emailController,
                          onSubmit: (value) {
                            print(value);
                          },
                          prefix: Icon(Icons.email_outlined),
                          label: Text('Email')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: myTextField(
                          controller: _passwordController,
                          onSubmit: (value) {
                            print(value);
                          },
                          prefix: Icon(Icons.lock),
                          label: Text('password')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: myButton(
                          onPressed: () {
                            LoginCubit.get(context).userLogin(
                                email: _emailController.text,
                                password: _passwordController.text);
                          },
                          width: double.infinity,
                          height: 50,
                          widget: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: myButton(
                          onPressed: () {
                            goTo(widget: RegisterScreen(), context: context);
                          },
                          width: double.infinity,
                          color: Colors.white,
                          height: 50,
                          widget: Text(
                            'Register',
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

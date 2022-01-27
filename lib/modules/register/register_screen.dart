import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/modules/register/cubit/cubit.dart';
import 'package:social_app/modules/register/cubit/states.dart';
import 'package:social_app/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessStates) {
            Fluttertoast.showToast(
                    msg: 'Register successfully',
                    backgroundColor: Colors.green,
                    gravity: ToastGravity.BOTTOM)
                .then((value) {
              popTo(context: context);
            });
          }
          if (state is RegisterErrorStates) {
            Fluttertoast.showToast(
                msg: state.error.toString().split(']').last,
                backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 7,
                            color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: myTextField(
                            controller: _nameController,
                            onSubmit: (value) {
                              print(value);
                            },
                            prefix: Icon(Icons.lock),
                            label: Text('Name')),
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
                            label: Text('Password')),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: myButton(
                            onPressed: () {
                              RegisterCubit.get(context).userRegister(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            },
                            width: double.infinity,
                            color: Colors.green,
                            height: 50,
                            widget: state is RegisterLoadingStates
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

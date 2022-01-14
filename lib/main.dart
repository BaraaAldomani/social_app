import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/components/constants.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  BlocOverrides.runZoned(()  {

          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  LoginScreen(),
    );
  }
}


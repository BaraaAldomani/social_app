import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/modules/splash_screen.dart';
import 'package:social_app/modules/test.dart';
import 'package:social_app/network/local/cache_helper.dart';
import 'package:social_app/shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () async {
      await CacheHelper.init();
      uId = CacheHelper.getData(key: 'uId') ?? '';
      runApp(MyApp(
        uId: uId!,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final String uId;
  const MyApp({Key? key, required this.uId}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: SplashScreen(
        uId: uId,
      ),
    );
  }
}

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
      color: secondColor,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: secondColor),
      titleTextStyle: GoogleFonts.blackOpsOne(color: firstColor)),
);

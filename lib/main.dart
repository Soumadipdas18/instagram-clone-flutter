import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home/instahome.dart';
import 'package:instagram_clone/pages/auth/signin.dart';
import 'package:instagram_clone/pages/auth/signup.dart';
import 'package:instagram_clone/pages/profile/profilescreen.dart';

import 'constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:PROFILE,
        routes: {
          SIGN_IN: (context) => Signinpage(),
          SIGN_UP: (context) => Signuppage(),
          HOME:(context)=>InstaHome(),
          PROFILE:(context)=>ProfileScreen()
        });
  }
}


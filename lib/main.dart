import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:instagram_clone/helper/sharedpref.dart';
import 'package:instagram_clone/models/instaloadingscreen.dart';
import 'package:instagram_clone/pages/auth/welcomescreen.dart';
import 'package:instagram_clone/pages/dmpage/dm.dart';
import 'package:instagram_clone/pages/home/instahome.dart';
import 'package:instagram_clone/pages/auth/signin.dart';
import 'package:instagram_clone/pages/auth/signup.dart';
import 'package:instagram_clone/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configLoading();
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String uid, username, bio, phno;
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return isloading
        ? MediaQuery(
            child: InstaLoading(),
            data: MediaQueryData(),
          )
        : MaterialApp(
            title: 'InstaDoge',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.grey,
            ),
            initialRoute: uid == null ? WELCOME : HOME,
            routes: {
              SIGN_IN: (context) => Signinpage(),
              SIGN_UP: (context) => Signuppage(),
              HOME: (context) => InstaHome(
                  username: username,
                  bio: bio,
                  phno: phno,
                  defaultpage: 0,
                  uid: uid),
              PROFILEHOME: (context) => InstaHome(
                  username: username,
                  bio: bio,
                  phno: phno,
                  defaultpage: 2,
                  uid: uid),
              DMPAGE: (context) => Dmpage(),
              WELCOME: (context) => Welcome()
            },
            builder: EasyLoading.init(),
          );
  }

  getdetails() async {
    sharedpref sf = new sharedpref();
    uid = await sf.getuid();
    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          bio = doc['bio'];
          phno = doc['phno'];
          username = doc['name'];
        });
      });
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getdetails();
  }
}

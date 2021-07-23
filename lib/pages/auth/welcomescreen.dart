import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceWidth * 0.05,
              ),
              Image.asset(
                'assets/instagram_logo.png',
                height: deviceWidth * .20,
              ),
              SizedBox(
                height: deviceWidth * 0.5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width-30,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SIGN_IN);
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: deviceWidth * 0.1,
              ),
              SizedBox(
                width:  MediaQuery.of(context).size.width-30,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SIGN_UP);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 2.0, color: Colors.blue)),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int buttonColor = 0xff26A9FF;
  bool inputTextNotNull = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 90,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: deviceWidth * .2,
                ),
                Image.asset(
                  'assets/instagram_logo.png',
                  height: deviceWidth * .20,
                ),
                SizedBox(
                  height: deviceWidth * .2,
                ),
                Container(
                  width: deviceWidth * .90,
                  height: deviceWidth * .14,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (usernameController.text.length >= 2 &&
                                passwordController.text.length >= 2) {
                              inputTextNotNull = true;
                            } else {
                              inputTextNotNull = false;
                            }
                          });
                        },
                        controller: usernameController,
                        style: TextStyle(
                          fontSize: deviceWidth * .040,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceWidth * .04,
                ),
                Container(
                  width: deviceWidth * .90,
                  height: deviceWidth * .14,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (usernameController.text.length >= 2 &&
                                passwordController.text.length >= 2) {
                              inputTextNotNull = true;
                            } else {
                              inputTextNotNull = false;
                            }
                          });
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          fontSize: deviceWidth * .040,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceWidth * .04,
                ),
                Container(
                  width: deviceWidth * .90,
                  height: deviceWidth * .14,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (usernameController.text.length >= 2 &&
                                passwordController.text.length >= 2) {
                              inputTextNotNull = true;
                            } else {
                              inputTextNotNull = false;
                            }
                          });
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          fontSize: deviceWidth * .040,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceWidth * .04,
                ),
                Container(
                  width: deviceWidth * .90,
                  height: deviceWidth * .14,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8E8),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (usernameController.text.length >= 2 &&
                                passwordController.text.length >= 2) {
                              inputTextNotNull = true;
                            } else {
                              inputTextNotNull = false;
                            }
                          });
                        },
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          fontSize: deviceWidth * .040,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceWidth * .04,
                ),
                inputTextNotNull
                    ? GestureDetector(
                        onLongPressStart: (s) {
                          setState(() {
                            buttonColor = 0xff78C9FF;
                          });
                        },
                        onLongPressEnd: (s) {
                          setState(() {
                            buttonColor = 0xff26A9FF;
                          });
                        },
                        onTap: () {
                          print('Sign Up');
                        },
                        child: Container(
                          width: deviceWidth * .90,
                          height: deviceWidth * .14,
                          decoration: BoxDecoration(
                            color: Color(buttonColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth * .040,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: deviceWidth * .90,
                        height: deviceWidth * .14,
                        decoration: BoxDecoration(
                          color: Color(0xff78C9FF),
                          borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceWidth * .040,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: deviceWidth * .075,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: deviceWidth * .40,
                      color: Color(0xffA2A2A2),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: deviceWidth * .040,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 1,
                      width: deviceWidth * .40,
                      color: Color(0xffA2A2A2),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceWidth * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/facebook.png',
                      height: deviceWidth * .060,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Login with facebook',
                      style: TextStyle(
                        color: Color(0xff1877f2),
                        fontSize: deviceWidth * .040,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceWidth * .2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

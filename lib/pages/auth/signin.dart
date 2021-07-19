import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
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
                  height: deviceWidth * .04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/instagram_logo.png',
                      height: deviceWidth * .20,
                    ),
                    SizedBox(
                      height: deviceWidth * .05,
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
                              hintText: 'Phone number , email or username',
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
                              Navigator.pushNamed(context, HOME);
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
                                  'Log In',
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
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceWidth * .040,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: deviceWidth * .035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot your login details? ',
                          style: TextStyle(
                            fontSize: deviceWidth * .035,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Get help');
                          },
                          child: Text(
                            'Get help',
                            style: TextStyle(
                              fontSize: deviceWidth * .035,
                              color: Color(0xff002588),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: deviceWidth * .040,
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
                  ],
                ),
                Container(
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: deviceWidth,
                        height: 1,
                        color: Color(0xffA2A2A2),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: deviceWidth * .040,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, SIGN_UP);
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xff00258B),
                                fontSize: deviceWidth * .040,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

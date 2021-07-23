import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/firebase/auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int buttonColor = 0xff26A9FF;
  bool inputTextNotNull = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  bool readonly = false;
  final keys = GlobalKey<FormState>();
  Auth auth = new Auth();

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
                Form(
                  key: keys,
                  child: Column(
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
                            child: TextFormField(
                              readOnly: readonly,
                              onChanged: (text) {
                                setState(() {
                                  if (emailController.text.length >= 2 &&
                                      passwordController.text.length >= 2) {
                                    inputTextNotNull = true;
                                    _btnController.stop();
                                  } else {
                                    inputTextNotNull = false;
                                  }
                                });
                              },
                              validator: (value) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value!)
                                    ? null
                                    : "Please Enter Correct Email";
                              },
                              controller: emailController,
                              style: TextStyle(
                                fontSize: deviceWidth * .040,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: 'Email Address',
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
                            child: TextFormField(
                              readOnly: readonly,
                              onChanged: (text) {
                                setState(() {
                                  if (emailController.text.length >= 2 &&
                                      passwordController.text.length >= 2) {
                                    inputTextNotNull = true;
                                    _btnController.stop();
                                  } else {
                                    inputTextNotNull = false;
                                  }
                                });
                              },
                              validator: (value) {
                                return value!.length > 6
                                    ? null
                                    : "Enter Password 6+ characters";
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
                          ? RoundedLoadingButton(
                              controller: _btnController,
                              onPressed: () async {
                                if (keys.currentState!.validate()) {
                                  setState(() {
                                    readonly = true;
                                  });
                                  FocusScope.of(context).unfocus();
                                  String msg = await auth.signIn(
                                      emailController.text.trim(),
                                      passwordController.text.trim());
                                  print(msg);
                                  if (msg == 'Logged in successfully') {
                                    await Phoenix.rebirth(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        content: Text(
                                          msg,
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                    _btnController.reset();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        content: Text(
                                          msg,
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                    _btnController.error();
                                    setState(() {
                                      readonly = false;
                                    });
                                  }
                                } else {
                                  _btnController.error();
                                }
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
                        height: deviceWidth * .2,
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

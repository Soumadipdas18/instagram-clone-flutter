import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/firebase/auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  int buttonColor = 0xff26A9FF;
  bool inputTextNotNull = false;
  final keys = GlobalKey<FormState>();
  Auth auth = new Auth();
  bool readonly = false;

  @override
  void dispose() {
    _btnController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 90,
            ),
            child: Form(
              key: keys,
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
                  // SizedBox(
                  //   height: deviceWidth * .2,
                  // ),
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
                        child: TextFormField(
                          readOnly: readonly,
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
                                  passwordController2.text.length >= 2 &&
                                  usernameController.text.length >= 2 &&
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
                        child: TextFormField(
                          readOnly: readonly,
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
                                  passwordController2.text.length >= 2 &&
                                  usernameController.text.length >= 2 &&
                                  passwordController.text.length >= 2) {
                                inputTextNotNull = true;
                                _btnController.stop();
                              } else {
                                inputTextNotNull = false;
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.length < 3)
                              return "Name must be of 3+ characters without any space";
                            else if (value.contains(' '))
                              return "Name must be of 3+ characters without any space";
                            else
                              return null;
                          },
                          controller: usernameController,
                          obscureText: false,
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
                        child: TextFormField(
                          readOnly: readonly,
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
                                  passwordController2.text.length >= 2 &&
                                  usernameController.text.length >= 2 &&
                                  passwordController.text.length >= 2) {
                                inputTextNotNull = true;
                                _btnController.stop();
                              } else {
                                inputTextNotNull = false;
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.length < 6)
                              return "Enter Password 6+ characters";
                            else if (value != passwordController2.text)
                              return "Passwords doesn't match";
                            else
                              return null;
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
                        child: TextFormField(
                          readOnly: readonly,
                          onChanged: (text) {
                            setState(() {
                              if (emailController.text.length >= 2 &&
                                  passwordController2.text.length >= 2 &&
                                  usernameController.text.length >= 2 &&
                                  passwordController.text.length >= 2) {
                                inputTextNotNull = true;
                                _btnController.stop();
                              } else {
                                inputTextNotNull = false;
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.length < 6)
                              return "Enter Password 6+ characters";
                            else if (value != passwordController.text)
                              return "Passwords doesn't match";
                          },
                          controller: passwordController2,
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
                      ? RoundedLoadingButton(
                          controller: _btnController,
                          onPressed: () async {
                            if (keys.currentState!.validate()) {
                              setState(() {
                                readonly = true;
                              });
                              FocusScope.of(context).unfocus();
                              String msg = await auth.signUp(
                                  usernameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                              print(msg);
                              if (msg == 'Signup successful') {
                                await Phoenix.rebirth(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    content: Text(
                                      msg,
                                      style:
                                          TextStyle(color: Colors.blueAccent),
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
                                      style:
                                          TextStyle(color: Colors.blueAccent),
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
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    height: deviceWidth * .05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

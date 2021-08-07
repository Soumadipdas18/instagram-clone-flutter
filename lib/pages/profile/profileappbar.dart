import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Spacer(),
                IconButton(
                  icon: Icon(Icons.lock),
                  onPressed: () {},
                ),
                Text(
                  widget.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('Log Out'),
                              onTap: () {
                                showAlertDialog(BuildContext context) {
                                  // set up the buttons
                                  Widget cancelButton = FlatButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                  Widget continueButton = FlatButton(
                                    child: Text("Continue"),
                                    onPressed: () async {
                                      SharedPreferences preferences =
                                          await SharedPreferences.getInstance();
                                      await preferences.clear();
                                      await auth.signOut();
                                      Phoenix.rebirth(context);
                                    },
                                  );
                                  // set up the AlertDialog
                                  AlertDialog alert = AlertDialog(
                                    title: Text("Are you sure"),
                                    content: Text("Would you like to log out?"),
                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );
                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }

                                ;
                                return showAlertDialog(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.lock_outlined),
                              title: Text('Reset Password'),
                              onTap: () {
                                showAlertDialog(BuildContext context) {
                                  // set up the buttons
                                  Widget cancelButton = FlatButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                  Widget continueButton = FlatButton(
                                    child: Text("Continue"),
                                    onPressed: () async {
                                      String email = auth.currentUser!.email!;
                                      auth.sendPasswordResetEmail(email: email);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          content: Text(
                                            'Password reset mail sent successfully',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  );
                                  // set up the AlertDialog
                                  AlertDialog alert = AlertDialog(
                                    title: Text("Are you sure"),
                                    content: Text(
                                        "Would you like to reset password?"),
                                    actions: [
                                      cancelButton,
                                      continueButton,
                                    ],
                                  );
                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }

                                return showAlertDialog(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/data/allstories.dart';
import 'package:instagram_clone/models/gradient_ring.dart';
import 'package:instagram_clone/pages/profile/editprofile.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail(
      {Key? key, required this.username, required this.bio, required this.phno})
      : super(key: key);
  final String username, bio, phno;

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  double? _height, _width;
  FirebaseAuth auth = FirebaseAuth.instance;
  late String? _photoURL;
  late final String uid;
  late final User user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    uid = user.uid;
    _photoURL = auth.currentUser!.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            WGradientRing(
              width: 0.0,
              child: Container(
                width: _width! / 5,
                height: _width! / 5,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: _photoURL != null
                      ? DecorationImage(
                          image: NetworkImage(_photoURL!), fit: BoxFit.cover)
                      : DecorationImage(
                          image: AssetImage('assets/posts/doge.jpg'),
                          fit: BoxFit.cover),
                ),
              ),
            ),
            Column(children: [Text("50"), Text('Posts')]),
            Column(children: [Text("200"), Text('Followers')]),
            Column(children: [Text("300"), Text('Following')])
          ]),
          SizedBox(
            height: 20.0,
          ),
          Text(
            widget.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.bio),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => EditProfileScreen(
                          username: widget.username,
                          email: user.email!,
                          uid: uid,
                          bio: widget.bio,
                          phno: widget.phno),
                    ),
                  ).whenComplete(() {
                    setState(() {
                      Navigator.pushReplacementNamed(context, HOME);
                    });
                  });
                },
                child: Text(
                  "Edit Your Profile",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Color(0xffCBCBCB)))))),
          ),
        ],
      ),
    );
  }
}

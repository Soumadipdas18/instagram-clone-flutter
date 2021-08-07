import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/data/allstories.dart';
import 'package:instagram_clone/models/gradient_ring.dart';
import 'package:instagram_clone/models/instaloadingscreen.dart';
import 'package:instagram_clone/pages/profile/editprofile.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail(
      {Key? key,
      required this.uid,
      required this.username,
      required this.bio,
      required this.phno})
      : super(key: key);
  final String username, bio, phno, uid;

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

  var collecref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: collecref.where('uid', isEqualTo: widget.uid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return InstaLoading();
        }
        if (snapshot.connectionState == ConnectionState.active) {
          var userdata = snapshot.data!.docs;
          return Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WGradientRing(
                        width: 0.0,
                        child: Container(
                          width: _width! / 5,
                          height: _width! / 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: _photoURL != null
                                ? DecorationImage(
                                    image: NetworkImage(_photoURL!),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: AssetImage('assets/posts/doge.jpg'),
                                    fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text("${userdata[0]['post_ids'].length}"),
                          Text('Posts')
                        ],
                      ),
                      Column(
                        children: [
                          Text("${userdata[0]['follower'].length}"),
                          Text('Followers')
                        ],
                      ),
                      Column(
                        children: [
                          Text("${userdata[0]['following'].length}"),
                          Text('Following')
                        ],
                      )
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
                            builder: (BuildContext context) =>
                                EditProfileScreen(
                                    username: widget.username,
                                    email: user.email!,
                                    uid: uid,
                                    bio: widget.bio,
                                    phno: widget.phno),
                          ),
                        ).whenComplete(() {
                          setState(() {
                            Navigator.popAndPushNamed(context, PROFILEHOME);
                          });
                        });
                      },
                      child: Text(
                        "Edit Your Profile",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Color(0xffCBCBCB)))))),
                ),
              ],
            ),
          );
        } else {
          return InstaLoading();
        }
      },
    );
  }
}

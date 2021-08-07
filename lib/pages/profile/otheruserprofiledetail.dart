import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/gradient_ring.dart';
import 'package:instagram_clone/models/instaloadingscreen.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage(
      {Key? key,
      required this.uid,
      required this.username,
      required this.bio,
      required this.photoURL})
      : super(key: key);
  final String username, bio, uid, photoURL;

  @override
  _OtherProfilePageState createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  double? _height, _width;
  FirebaseAuth auth = FirebaseAuth.instance;
  var collecrefusers = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
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
                            image: DecorationImage(
                                image: NetworkImage(widget.photoURL),
                                fit: BoxFit.cover)),
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
                  ],
                ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      userdata[0]['follower'].contains(auth.currentUser!.uid)
                          ? Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              child: ElevatedButton(
                                onPressed: () {
                                  List follower = userdata[0]['follower'];
                                  follower.remove(auth.currentUser!.uid);
                                  collecref
                                      .doc(userdata[0].id)
                                      .update({'follower': follower});
                                  collecrefusers
                                      .where('uid',
                                          isEqualTo: auth.currentUser!.uid)
                                      .get()
                                      .then((QuerySnapshot querySnapshot) {
                                    querySnapshot.docs.forEach((doc) {
                                      List following = doc['following'];
                                      following.remove(widget.uid);
                                      collecrefusers
                                          .doc(auth.currentUser!.uid)
                                          .update({'following': following});
                                    });
                                  });
                                },
                                child: Text(
                                  "Unfollow",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              child: ElevatedButton(
                                onPressed: () {
                                  List follower = userdata[0]['follower'];
                                  follower.insert(0, auth.currentUser!.uid);
                                  collecref
                                      .doc(userdata[0].id)
                                      .update({'follower': follower});
                                  collecrefusers
                                      .where('uid',
                                          isEqualTo: auth.currentUser!.uid)
                                      .get()
                                      .then((QuerySnapshot querySnapshot) {
                                    querySnapshot.docs.forEach((doc) {
                                      List following = doc['following'];
                                      following.insert(0, widget.uid);
                                      collecrefusers
                                          .doc(auth.currentUser!.uid)
                                          .update({'following': following});
                                    });
                                  });
                                },
                                child: Text(
                                  "Follow",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                              ),
                            ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Message",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                  color: Color(0xffCBCBCB),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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

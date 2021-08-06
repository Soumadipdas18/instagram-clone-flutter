import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/allposts.dart';
import 'package:instagram_clone/pages/profile/profileappbar.dart';
import 'package:instagram_clone/pages/profile/profiledetail.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {Key? key,
      required this.username,
      required this.bio,
      required this.phno,
      required this.uid})
      : super(key: key);
  final String username, bio, phno, uid;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: ProfileAppBar(
            username: widget.username,
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 55)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileDetail(
                username: widget.username, bio: widget.bio, phno: widget.phno),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: List.generate(
                postsbyuser.length,
                (index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 3) / 3,
                    height: (MediaQuery.of(context).size.width - 3) / 3,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(postsbyuser[index].what_posted)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  getallposts(String uid) async {
    print('getallposts called');
    postsbyuser.clear();
    if (collectionRef.snapshots().length != 0) {
      await collectionRef
          .orderBy('time', descending: false)
          .get()
          .then((querysnapshot) {
        querysnapshot.docs.forEach((doc) {
          postsbyuser.insert(
            postsbyuser.length,
            allposts(
                who_posted: doc['who_posted_username'],
                when_posted: 'ddd',
                what_posted: doc['url'],
                caption_post: doc['caption'],
                who_liked: ['a', 'b', 'c', 'd'],
                who_posted_url: doc['who_posted_url']),
          );
        });
        last = querysnapshot.docs[querysnapshot.docs.length - 1];
        print(last);
      });
    }
    postsbyuser = new List.from(postsbyuser.reversed);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    collectionRef = FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.uid)
        .collection('userposts');
    getallposts(widget.uid);
  }

  var collectionRef;
  var last;
  List<allposts> postsbyuser = [];
}

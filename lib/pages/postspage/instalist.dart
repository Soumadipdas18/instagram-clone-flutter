import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/models/instaloadingscreen.dart';
import 'package:intl/intl.dart';
import 'instastory.dart';

class InstaList extends StatefulWidget {
  InstaList({required this.uid});

  final String uid;

  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _snackbar1 = SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(
        'You have liked the post',
        style: TextStyle(color: Colors.blueAccent),
      ),
      behavior: SnackBarBehavior.floating,
    );
    var deviceSize = MediaQuery.of(context).size;
    var collectionRef = FirebaseFirestore.instance.collection('allposts');
    var collectionRefposts = FirebaseFirestore.instance.collection('posts');
    return StreamBuilder<QuerySnapshot>(
        stream: collectionRef.orderBy('time', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return InstaLoading();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            var postdata = snapshot.data!.docs;
            return ListView.builder(
              itemCount: snapshot.data!.docs.length + 1,
              itemBuilder: (context, index) => index == 0
                  ? SizedBox(
                      child: InstaStories(),
                      height: 120,
                    )
                  : snapshot.data!.docs.length == 0
                      ? Center(child: Text("No posts yet"))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  postdata[index - 1]
                                                      ['who_posted_url'])),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        postdata[index - 1]
                                            ['who_posted_username'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  PopupMenuButton(
                                    color: Colors.white,
                                    elevation: 40,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text("Delete post"),
                                        value: 1,
                                      ),
                                    ],
                                    onSelected: (int index) {
                                      if (index == 1)
                                        collectionRef
                                            .doc(postdata[index - 1].id)
                                            .delete();
                                      collectionRefposts
                                          .doc(widget.uid)
                                          .collection('userposts')
                                          .doc(postdata[index - 1].id)
                                          .delete();
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: deviceSize.width,
                              width: deviceSize.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        postdata[index - 1]['url'])),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(postdata[index - 1]
                                                    ['who_liked']
                                                .contains(widget.uid)
                                            ? Icons.favorite
                                            : FontAwesomeIcons.heart),
                                        color: postdata[index - 1]['who_liked']
                                                .contains(widget.uid)
                                            ? Colors.red
                                            : Colors.black,
                                        iconSize: postdata[index - 1]
                                                    ['who_liked']
                                                .contains(widget.uid)
                                            ? 30
                                            : 25,
                                        onPressed: () {
                                          if (isPressed)
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(_snackbar1);

                                          isPressed = !isPressed;

                                          if (isPressed)
                                            updatelike(
                                                postdata[index - 1].id,
                                                postdata[index - 1]
                                                    ['who_liked']);
                                          else
                                            unupdatelike(
                                                postdata[index - 1].id,
                                                postdata[index - 1]
                                                    ['who_liked']);
                                        },
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.comment,
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      Icon(FontAwesomeIcons.paperPlane),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "${postdata[index - 1]['who_liked'].length} likes",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                postdata[index - 1]['caption'],
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text("View all comments",
                                      style: TextStyle(color: Colors.grey))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 6.0, 0.0, 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            auth.currentUser!.photoURL!),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Add a comment...",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                  "${timeConvert(postdata[index - 1]['time'])}",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
            );
          } else {
            return InstaLoading();
          }
        });
  }

  @override
  void initState() {}

  updatelike(String id, List who_liked) {
    if (!who_liked.contains(widget.uid)) {
      who_liked.add(widget.uid);
      collectionRef.doc(id).update({'who_liked': who_liked});
    }
  }

  unupdatelike(String id, List who_liked) {
    who_liked.remove(widget.uid);
    collectionRef.doc(id).update({'who_liked': who_liked});
  }

  String timeConvert(int timeInMillis) {
    var time = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedtime = DateFormat('MM/dd/yyyy, hh:mm a').format(time);
    return formattedtime;
  }

  var collectionRef = FirebaseFirestore.instance.collection('allposts');

  var last;
}

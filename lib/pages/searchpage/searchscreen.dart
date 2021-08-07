import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'package:instagram_clone/data/favcategories.dart';
import 'package:instagram_clone/data/searchpageusermodel.dart';
import 'package:instagram_clone/models/searchpageusertile.dart';
import 'package:instagram_clone/pages/profile/profilescreen.dart';
import 'package:instagram_clone/pages/searchpage/categorystoryitem.dart';
import 'package:instagram_clone/pages/searchpage/trendingposts.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key, required this.username, required this.uid})
      : super(key: key);
  final String username, uid;

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: searchcontroller.text.length == 0
          ? TrendingPost()
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    if (widget.uid != users[i].uid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            username: "",
                            bio: "",
                            phno: "",
                            uid: "",
                            otheruserid: users[i].uid,
                            otherusername: users[i].username,
                            otheruserbio: users[i].bio,
                            otherphotourl: users[i].photoURL,
                          ),
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, PROFILEHOME);
                    }
                  },
                  child: SearchPageUserTile(
                      name: users[i].username,
                      username: users[i].username,
                      photoURL: users[i].photoURL),
                );
              },
            ),
    );
  }

  TextEditingController searchcontroller = new TextEditingController();
  List<SearchPageUserModel> users = [];
  List usernames = [];

  PreferredSizeWidget Appbar() {
    var size = MediaQuery.of(context).size;
    return PreferredSize(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          SafeArea(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width - 20,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: TextFormField(
                    onChanged: (text) {
                      usernames = [];
                      users = [];
                      if (text.length != 0) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .where('searchname', arrayContains: text)
                            .get()
                            .then((snapshot) {
                          setState(() {
                            snapshot.docs.forEach(
                              (element) {
                                if (!usernames.contains(element['name'])) {
                                  usernames.insert(0, element['name']);
                                  users.insert(
                                      0,
                                      SearchPageUserModel(
                                          fullname: element['name'],
                                          username: element['name'],
                                          photoURL: element['dp'],
                                          bio: element['bio'],
                                          uid: element['uid']));
                                }
                              },
                            );
                          });
                        });
                      }
                    },
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        // color:  Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: List.generate(
                  searchCategories.length,
                  (index) {
                    return CategoryStoryItem(
                      name: searchCategories[index],
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
      preferredSize: new Size(size.width, 140),
    );
  }
}

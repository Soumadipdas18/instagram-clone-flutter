import 'package:flutter/material.dart';
import 'package:instagram_clone/data/allposts.dart';
import 'package:instagram_clone/pages/profile/profileappbar.dart';
import 'package:instagram_clone/pages/profile/profiledetail.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {Key? key, required this.username, required this.bio, required this.phno})
      : super(key: key);
  final String username, bio, phno;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                posts.length,
                (index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 3) / 3,
                    height: (MediaQuery.of(context).size.width - 3) / 3,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(posts[index].what_posted)),
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

  List<allposts> posts = [];
}

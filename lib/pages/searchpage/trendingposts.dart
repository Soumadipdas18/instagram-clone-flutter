import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/data/allposts.dart';

class TrendingPost extends StatefulWidget {
  const TrendingPost({Key? key}) : super(key: key);

  @override
  _TrendingPostState createState() => _TrendingPostState();
}

class _TrendingPostState extends State<TrendingPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        shrinkWrap: true,
        itemCount: trendingpost.length,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(trendingpost[index].what_posted)),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(
            (index - 1) % 9 == 0 && index != 0 ? 2 : 1,
            (index - 1) % 9 == 0 && index != 0 ? 2 : 1),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      )
    );
  }
  getallposts() async {
    print('getallposts called');
    trendingpost.clear();
    if (collectionRef.snapshots().length != 0) {
      await collectionRef
          .orderBy('time', descending: true)
          .get()
          .then((querysnapshot) {
        querysnapshot.docs.forEach((doc) {
          trendingpost.insert(
            trendingpost.length,
            allposts(
                who_posted: doc['who_posted_username'],
                when_posted: 'ddd',
                what_posted: doc['url'],
                caption_post: doc['caption'],
                who_liked: ['a', 'b', 'c', 'd'],
                who_posted_url: doc['who_posted_url']),
          );
          trendingpost = List.from(trendingpost.reversed);
        });
        last = querysnapshot.docs[querysnapshot.docs.length - 1];
        print(last);
      });
    }
    trendingpost = new List.from(trendingpost.reversed);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getallposts();
  }

  var collectionRef = FirebaseFirestore.instance.collection('allposts');
  var last;
  bool loading = true;
  List<allposts> trendingpost = [];
}

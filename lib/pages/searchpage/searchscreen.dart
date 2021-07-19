import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/data/allposts.dart';
import 'package:instagram_clone/data/favcategories.dart';
import 'package:instagram_clone/pages/searchpage/categorystoryitem.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        body: new StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          shrinkWrap: true,
          itemCount: 60,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(
              (index - 1) % 9 == 0 && index != 0 ? 2 : 1,
              (index - 1) % 9 == 0 && index != 0 ? 2 : 1),
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ));
  }

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
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          // color:  Colors.grey,
                        )),
                    cursorColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                )
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

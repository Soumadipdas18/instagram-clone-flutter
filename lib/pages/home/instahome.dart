import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/postspage/instabody.dart';
import 'package:instagram_clone/pages/profile/profilescreen.dart';
import 'package:instagram_clone/pages/searchpage/searchscreen.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({Key? key}) : super(key: key);

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  var active = "Home";
  List<Widget> screens = [InstaBody(), Searchpage(), ProfileScreen()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: screens[index],
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: active == 'Home'
                    ? Icon(
                        Icons.home,
                        size: 30,
                      )
                    : Icon(
                        Icons.home_outlined,
                        size: 30,
                      ),
                onPressed: () {
                  setState(() {
                    index = 0;
                    active = 'Home';
                  });
                },
              ),
              new IconButton(
                  icon: active == 'Search'
                      ? Icon(
                          Icons.search,
                          size: 32,
                        )
                      : Icon(
                          Icons.search_outlined,
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                      active = 'Search';
                    });
                  }),
              new IconButton(
                  icon: active == 'Add'
                      ? Icon(
                          Icons.add_box,
                          size: 30,
                        )
                      : Icon(
                          Icons.add_box_outlined,
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      active = 'Add';
                    });
                  }),
              new IconButton(
                  icon: active == 'Love'
                      ? Icon(
                          Icons.favorite,
                          size: 30,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          size: 30,
                        ),
                  onPressed: () {
                    setState(() {
                      active = 'Love';
                    });
                  }),
              new InkWell(
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/posts/doge.jpg')),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

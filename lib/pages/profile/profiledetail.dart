import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/allstories.dart';
import 'package:instagram_clone/models/gradient_ring.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  double? _height, _width;

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
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(stories[0].what_posted)),
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
            "doge",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("I am doge"),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {},
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

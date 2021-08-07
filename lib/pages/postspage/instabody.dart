import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/constants.dart';
import 'instalist.dart';

class InstaBody extends StatelessWidget {
  final String uid;

  InstaBody(this.uid);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),
          title: SizedBox(
              height: 35.0, child: Image.asset("assets/instagram_logo.png")),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, DMPAGE),
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: InstaList(
              uid: uid,
            ))
          ],
        ),
      ),
    );
  }
}

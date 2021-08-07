import 'package:flutter/material.dart';
import 'package:instagram_clone/models/gradient_ring.dart';
import 'package:instagram_clone/data/allstories.dart';

class InstaStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) => Stack(
                  // alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Column(children: [
                      WGradientRing(
                        width: index == 0 ? 0.0 : 2.0,
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(stories[index].what_posted)),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      if (stories[index].who_posted.length > 6)
                        Text(
                          stories[index].who_posted.replaceRange(
                              6, stories[index].who_posted.length, '..'),
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      if (stories[index].who_posted.length <= 6)
                        Text(
                          stories[index].who_posted,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                    ]),
                    index == 0
                        ? Positioned(
                            right: 10.0,
                            top: 50.0,
                            child: InkWell(
                              child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 10.0,
                                child: Icon(
                                  Icons.add,
                                  size: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
                            ))
                        : Container()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryStoryItem extends StatelessWidget {
  final String name;

  const CategoryStoryItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(right: 10),
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.white.withOpacity(0.2))),
        child: new Padding(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: new Row(
            children:[
            new Icon(Icons.shop_rounded),
            new SizedBox(width:3),
            new Text(
              name,
              style: new TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            ),
          ]
          ),
        ),
      ),
    );
  }
}
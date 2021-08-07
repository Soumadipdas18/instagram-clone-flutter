import 'package:flutter/material.dart';

class CategoryStoryItem extends StatelessWidget {
  final String name;

  const CategoryStoryItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.white.withOpacity(0.2))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(children: [
            Icon(Icons.shop_rounded),
            SizedBox(width: 3),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            ),
          ]),
        ),
      ),
    );
  }
}

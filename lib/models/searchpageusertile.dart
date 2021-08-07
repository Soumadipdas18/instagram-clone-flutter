import 'package:flutter/material.dart';

import 'gradient_ring.dart';

class SearchPageUserTile extends StatelessWidget {
  const SearchPageUserTile(
      {Key? key,
      required this.name,
      required this.username,
      required this.photoURL})
      : super(key: key);
  final String photoURL;
  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey.shade400),
              bottom: BorderSide(color: Colors.grey.shade400))
          ),
      child: ListTile(
        title: Text(
          username,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(name),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              photoURL),
          radius: 30,
        ),
      ),
    );
  }
}

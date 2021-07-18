import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Spacer(),

                new IconButton(
                  icon:new Icon(Icons.lock),
                  onPressed: (){},
                ),

                new Text(
                  "doge",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new IconButton(
                  icon:new Icon(Icons.arrow_drop_down),
                  onPressed: (){},
                ),

                new Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

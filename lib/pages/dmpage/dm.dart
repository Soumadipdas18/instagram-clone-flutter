import 'package:flutter/material.dart';

class Dmpage extends StatefulWidget {
  const Dmpage({Key? key}) : super(key: key);

  @override
  _DmpageState createState() => _DmpageState();
}

class _DmpageState extends State<Dmpage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'doge',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 20,
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () => {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.camera_alt,
              size: 30,
              color: Colors.blue,
            ),
            Text(
              'Camera',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width - 30,
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
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Active 13m ago'),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
              ),
              trailing: Icon(
                Icons.camera_alt,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

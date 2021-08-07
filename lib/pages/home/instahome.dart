import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/firebase/upload.dart';
import 'package:instagram_clone/pages/postspage/instabody.dart';
import 'package:instagram_clone/pages/profile/profilescreen.dart';
import 'package:instagram_clone/pages/searchpage/searchscreen.dart';

class InstaHome extends StatefulWidget {
  const InstaHome(
      {Key? key,
      required this.username,
      required this.bio,
      required this.phno,
      required this.defaultpage,
      required this.uid})
      : super(key: key);
  final String username, bio, phno, uid;
  final int defaultpage;

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  final picker = ImagePicker();
  var active = "Home";
  FirebaseAuth fauth = FirebaseAuth.instance;
  late String? _photoURL;
  late int index;
  FileUpload fup = new FileUpload();
  FirebaseAuth auth = FirebaseAuth.instance;
  late final String uid;
  late final User user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
    uid = user.uid;
    index = widget.defaultpage;
    _photoURL = fauth.currentUser!.photoURL;
  }

  bool isparentloading = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      InstaBody(widget.uid),
      Searchpage(username: widget.username,),
      ProfileScreen(
          username: widget.username,
          bio: widget.bio,
          phno: widget.phno,
          uid: uid)
    ];
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
                    addfile();
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
                child: Stack(
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: _photoURL != null
                            ? DecorationImage(
                                image: NetworkImage(_photoURL!),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: AssetImage('assets/posts/doge.jpg'),
                                fit: BoxFit.cover),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ],
                ),
                onTap: () {
                  setState(
                    () {
                      index = 2;
                      active = 'profile';
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addfile() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: IntrinsicWidth(
              child: IntrinsicHeight(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: InkWell(
                      child: new Container(
                          height: 40.0,
                          child:
                              Center(child: const Text('Capture with camera'))),
                      onTap: () async {
                        var pickedFile =
                            await picker.getImage(source: ImageSource.camera);
                        if (pickedFile != null)
                          await _cropImage(pickedFile.path);
                      },
                    ),
                  ),
                  Divider(),
                  // Cancel button
                  InkWell(
                      child: new Container(
                          height: 40.0,
                          child:
                              Center(child: const Text('Upload from device'))),
                      onTap: () async {
                        var pickedFile =
                            await picker.getImage(source: ImageSource.gallery);
                        if (pickedFile != null)
                          await _cropImage(pickedFile.path);
                      }),
                ],
              )
                  // add button
                  ),
            ),
          ),
        );
      },
    );
  }

  _cropImage(filePath) async {
    var croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      // maxWidth: 1080,
      // maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
      ],
    );
    if (croppedImage != null) {
      Navigator.pop(context);
      await getnamebio(croppedImage, 'upload');
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Future<dynamic> getnamebio(var pickedFile, String upload) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return isparentloading ? false : true;
          },
          child: AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        return value!.length != 0
                            ? null
                            : "Please Enter something";
                      },
                    ),
                  ),
                  Text('Caption'),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: bioController,
                      maxLines: 3,
                      maxLength: 75,
                      validator: (value) {
                        return value!.length != 0
                            ? null
                            : "Please Enter something";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          EasyLoading.show(
                            status: 'uploading...',
                          );
                          isparentloading = true;
                          await fup.uploadfromdevice(
                              widget.username,
                              user.photoURL!,
                              nameController.text.trim(),
                              bioController.text.trim(),
                              uid,
                              pickedFile);
                          isparentloading = false;
                          EasyLoading.showSuccess('Image updated successfully');
                          Navigator.pop(context);
                          Phoenix.rebirth(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

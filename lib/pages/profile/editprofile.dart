import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/firebase/auth.dart';
import 'package:instagram_clone/firebase/database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfileScreen extends StatefulWidget {
  final String username, email, uid, bio, phno;

  EditProfileScreen(
      {required this.username,
      required this.email,
      required this.uid,
      required this.bio,
      required this.phno});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool isloading = false;
  DatabaseFirestore df = new DatabaseFirestore();
  Auth auth = new Auth();
  FirebaseAuth fauth = FirebaseAuth.instance;
  late String? _photoURL;
  bool isparentloading = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.username;
    _emailController.text = widget.email;
    _bioController.text = widget.bio;
    _phoneController.text = widget.phno;
    _photoURL = fauth.currentUser!.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return isparentloading ? false : true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          elevation: 1,
          title: Text('Edit Profile'),
          leading: GestureDetector(
            child: Icon(Icons.close, color: Colors.black),
            onTap: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.done, color: Colors.blue),
                ),
                onTap: () {
                  askpassword(context);
                }),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        width: 110.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          image: _photoURL != null
                              ? DecorationImage(
                                  image: NetworkImage(_photoURL!),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: AssetImage('assets/posts/doge.jpg'),
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    onTap: () {}),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text('Change Photo',
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () {
                    pickImage();
                  },
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: TextField(
                    controller: _bioController,
                    maxLines: 3,
                    maxLength: 75,
                    decoration:
                        InputDecoration(hintText: 'Bio', labelText: 'Bio'),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Private Information',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Email address', labelText: 'Email address'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        hintText: 'Phone Number', labelText: 'Phone Number'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> askpassword(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return isloading ? false : true;
          },
          child: AlertDialog(
            title: Text('Enter password'),
            content: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            actions: <Widget>[
              // add button
              FlatButton(
                child: Text('DONE'),
                onPressed: () async {
                  int count = 0;
                  isloading = true;
                  FocusScope.of(context).unfocus();
                  EasyLoading.show(
                    status: 'loading...',
                  );
                  String firstcheck =
                      await auth.signIn(widget.email, _passwordController.text);
                  if (firstcheck == 'Logged in successfully') {
                    bool usernamupdatesuccess =
                        _nameController.text != widget.username
                            ? await df.updateusername(
                                _nameController.text, widget.uid)
                            : true;
                    if (!usernamupdatesuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        content: Text(
                          'Username already exist',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        behavior: SnackBarBehavior.floating,
                      ));
                      Navigator.of(context).pop();
                    } else {
                      String msg = _emailController.text != widget.email
                          ? await auth.updateemail(
                              widget.email,
                              _passwordController.text,
                              _emailController.text,
                              widget.uid)
                          : 'Updated successfully';
                      print(msg);
                      // EasyLoading.dismiss();

                      if (msg == 'Updated successfully') {
                        _bioController.text != widget.bio
                            ? await df.updatebio(
                                _bioController.text, widget.uid)
                            : null;
                        _phoneController.text != widget.phno
                            ? await df.updatephno(
                                _phoneController.text, widget.uid)
                            : null;
                        await EasyLoading.dismiss();
                        isloading = false;
                        count++;
                      } else {
                        _nameController.text != widget.username
                            ? await df.updateusername(
                                widget.username, widget.uid)
                            : null;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            'Email already exist',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          behavior: SnackBarBehavior.floating,
                        ));
                        Navigator.of(context).pop();
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text(
                        'Password incorrect',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ));
                    Navigator.of(context).pop();
                  }
                  await EasyLoading.dismiss();
                  isloading = false;
                  count > 0 ? await Phoenix.rebirth(context) : null;
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _passwordController.clear();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  final picker = ImagePicker();

  _cropImage(filePath) async {
    var croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      // maxWidth: 1080,
      // maxHeight: 1080,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
    );
    if (croppedImage != null) {
      isparentloading = true;
      EasyLoading.show(
        status: 'uploading...',
      );
      File file = File(croppedImage!.path);
      firebase_storage.Reference firebaseStorageRef = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('userdp/${widget.uid}');
      var uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask.whenComplete(() async {
        String photoURL = await firebase_storage.FirebaseStorage.instance
            .ref('userdp/${widget.uid}')
            .getDownloadURL();
        fauth.currentUser!.updatePhotoURL(photoURL);
        await df.updatedp(photoURL, widget.uid);
        setState(() {
          _photoURL = photoURL;
        });
        print('done uploading');
        EasyLoading.showSuccess('Image updated successfully');
        isparentloading = false;
      });
    }
  }

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) await _cropImage(pickedFile.path);
  }
}

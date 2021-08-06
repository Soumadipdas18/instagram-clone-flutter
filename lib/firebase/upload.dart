import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';


class FileUpload {
  var uuid = Uuid();
  var collectionRef = FirebaseFirestore.instance.collection('posts');
  var collectionRef2 = FirebaseFirestore.instance.collection('allposts');
  uploadfromdevice(String username, String profileURL, String name, String bio,
      String uid, var pickedFile) async {
    if (pickedFile != null) {
      var time = DateTime.now().millisecondsSinceEpoch;
      String postid =uuid.v1();
      File file = File(pickedFile.path);
      firebase_storage.Reference firebaseStorageRef = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('posts/${uid}/${postid}');
      var uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask.whenComplete(() async {
        String photoURL = await firebase_storage.FirebaseStorage.instance
            .ref('posts/${uid}/${postid}')
            .getDownloadURL();
        Map<String, dynamic> postdata = {
          'who_posted_username': username,
          'who_posted_uid': uid,
          'name': name,
          'caption': bio,
          'url': photoURL,
          'time': time,
          'who_posted_url': profileURL,
          'who_liked':[],
          'post_id':postid
        };
        await collectionRef
            .doc(uid)
            .collection('userposts')
            .doc(postid)
            .set(postdata);
        await collectionRef2.doc(postid).set(postdata);
      });
    }
  }
}

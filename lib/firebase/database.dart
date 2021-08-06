import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/helper/sharedpref.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseFirestore {
  sharedpref sf = new sharedpref();

  Future<bool> updateusername(String username, String uid) async {
    bool check = await usernameExist(username);
    if (check) {
      return false;
    } else {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'name': username});
      return true;
    }
  }

  Future<bool> usernameExist(String username) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where("name", isEqualTo: username)
        .get()
        .then((snapshot) {
      if (snapshot.docs.length > 0) {
        check = true;
      } else {
        check = false;
      }
    });
    return check;
  }

  Future<void> updatephno(String phno, String uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'phno': phno}, SetOptions(merge: true));
  }

  Future<void> updatebio(String bio, String uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'bio': bio}, SetOptions(merge: true));
  }

  Future<void> updatedp(String url, String uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'dp': url}, SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection('allposts')
        .where('who_posted_uid', isEqualTo: uid)
        .snapshots()
        .forEach((element) {
      element.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('allposts')
            .doc(element.id)
            .update({'who_posted_url': url});
      });
    });
    // await FirebaseFirestore.instance
    //     .collection('posts')
    //     .doc(uid)
    //     .collection('userposts')
    //     .where('who_posted_uid', isEqualTo: uid)
    //     .snapshots()
    //     .forEach((element1) {
    //   element1.docs.forEach((element1) {
    //     FirebaseFirestore.instance
    //         .collection('posts')
    //         .doc(uid)
    //         .collection('userposts')
    //         .doc(element1.id)
    //         .update({'who_posted_url': url});
    //   });
    // });
  }
}

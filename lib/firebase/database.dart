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
    var collecref = FirebaseFirestore.instance.collection('allposts');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'dp': url});

    await collecref
        .where('who_posted_uid', isEqualTo: uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((value) {
        print("users: results: value");
        collecref.doc(value.id).update({'who_posted_url': url});
      });
    }).catchError((onError) {
      print("getCloudFirestoreUsers: ERROR");
      print(onError);
    });
    // //     .forEach((element) {
    // //       if(element.docs[i]!=null) {
    // //         print(element.size);
    // //         print(i);
    // //         if (i == element.size)
    // //           return;
    // //         if (i != element.size) {
    //           FirebaseFirestore.instance
    //               // .collection('allposts')
    //               // .doc(element.docs[i].id)
    //               // .update({'who_posted_url': url});
    // //         }
    // //         i++;
    // //         print("done");
    // //         if (i == element.size)
    // //           return;
    // //       }
    // //       else{
    // //         print('nul');
    // //         return;
    // //       }
    // // });
    // print("exicuting initial");
    //
    //
    //
    // print("exit");
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

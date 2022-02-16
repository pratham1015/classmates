import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CloudService {
  DocumentReference docref = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser?.uid);

  Future<void> addUserInfo(userData) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .set(userData)
        .whenComplete(
            () => Fluttertoast.showToast(msg: "Data Saved Successfully"))
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  getUserInfo(String uid) async {
    return FirebaseFirestore.instance
        .collection("Users")
        .where("Uid", isEqualTo: uid)
        .get()
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  Future<DocumentSnapshot> getMyInfo(String uid) async {
    DocumentSnapshot docSnapshot = await docref.get();
    return docSnapshot;
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen {
  late PickedFile image;
  final _picker = ImagePicker();

  Future<void> _doSomething(File _image1) async {
    Fluttertoast.showToast(msg: "aaa");
    final _fireStorage = FirebaseStorage.instance;
    final firebaseauth = FirebaseAuth.instance;
    String uid = firebaseauth.currentUser!.uid;

    if (_image1 != null) {
      DocumentReference docref = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid);

      await _fireStorage
          .ref()
          .child('Images/$uid/image1')
          .putFile(_image1)
          .whenComplete(() async {
        String url1 = await _fireStorage
            .ref()
            .child('Images/$uid/image1')
            .getDownloadURL();
        await docref.update({"image1url": url1});
      }).catchError((error, stackTrace) {
        print(error);
        Fluttertoast.showToast(msg: error.toString());
      }).catchError((error, stackTrace) {
        print(error);
        Fluttertoast.showToast(msg: error.toString());
      });
    }
  }

  _imgFromCamera1() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    File _image1 = File(image!.path);
    _doSomething(_image1);
  }

  _imgFromGallery1() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File _image1 = File(image!.path);
    _doSomething(_image1);
  }

  showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library,
                        color: Color(0xfffd297b)),
                    title: const Text(
                      'Photo Library',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      _imgFromGallery1();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading:
                      const Icon(Icons.photo_camera, color: Color(0xfffd297b)),
                  title: const Text('Camera',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    _imgFromCamera1();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}

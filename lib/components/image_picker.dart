import 'dart:io';
import 'package:classmates/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen {
  final _fireStorage = FirebaseStorage.instance;
  final firebaseauth = FirebaseAuth.instance;
  final _picker = ImagePicker();
  XFile? image;

  _imgFromCamera1(BuildContext context) async {
    String uid = firebaseauth.currentUser!.uid;
    image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 30);
    File _image1 = File(image!.path);
    DocumentReference docref = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await _fireStorage
        .ref()
        .child('Images/$uid/image1')
        .putFile(_image1)
        .whenComplete(() async {
      String url1 =
          await _fireStorage.ref().child('Images/$uid/image1').getDownloadURL();
      await docref.update({"image1url": url1}).whenComplete(() {
        Fluttertoast.showToast(msg: "Image Uploaded Sucessfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }).catchError((error, stackTrace) {
        Fluttertoast.showToast(msg: error);
      });
    });
  }

  _imgFromGallery1(BuildContext context) async {
    String uid = firebaseauth.currentUser!.uid;
    image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    File _image1 = File(image!.path);
    DocumentReference docref = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await _fireStorage
        .ref()
        .child('Images/$uid/image1')
        .putFile(_image1)
        .whenComplete(() async {
      String url1 =
          await _fireStorage.ref().child('Images/$uid/image1').getDownloadURL();
      await docref.update({"image1url": url1}).whenComplete(() {
        Fluttertoast.showToast(msg: "Image Uploaded Sucessfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }).catchError((error, stackTrace) {
        Fluttertoast.showToast(msg: error);
      });
    });
  }

  void showPicker(context) {
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
                      _imgFromGallery1(context);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading:
                      const Icon(Icons.photo_camera, color: Color(0xfffd297b)),
                  title: const Text('Camera',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    _imgFromCamera1(context);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}

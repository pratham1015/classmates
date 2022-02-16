// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:classmates/components/image_picker.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/components/user_avatar.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/services/cloud_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  bool myprof = true;
  TextEditingController collegesearchController = TextEditingController();
  TextEditingController yearsearchController = TextEditingController();
  TextEditingController deptsearchController = TextEditingController();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  late File _image1;

  Widget searchperson(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Text(
          "Search User",
          style: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Container(
        padding: EdgeInsets.only(left: 6),
        child: const Text(
          "College",
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
        ),
      ),
      CustomTextField(
        controller: collegesearchController,
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(left: 6),
              child: const Text(
                "Year",
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
              ),
            ),
            CustomTextField(controller: yearsearchController)
          ]),
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(left: 6),
              child: const Text(
                "Department",
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
              ),
            ),
            CustomTextField(controller: deptsearchController)
          ]),
        ),
      ]),
      Container(
        padding: EdgeInsets.only(left: 6),
        child: const Text(
          "Class",
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: borderRadius10,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0, // soften the shadow
                spreadRadius: 2, //extend the shadow
                offset: Offset(
                  0, // Move to right 10  horizontally
                  0, // Move to bottom 10 Vertically
                ),
              )
            ]),
        height: 200,
        // width: 200,
      ),
      SizedBox(
        height: 25,
      ),
      Center(
        child: ReusableButton(
          text: "Invite",
        ),
      ),
    ]);
  }

  Widget myProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "My Profile",
            style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: UserAvatar(),
              onTap: () {
                _image1 = ImageScreen().showPicker(context);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 5),
              child: Text(
                "Badges",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 6),
          child: const Text(
            "Name",
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
          ),
        ),
        CustomTextField(
          controller: nameController,
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 6),
          child: const Text(
            "College",
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
          ),
        ),
        CustomTextField(
          controller: collegeController,
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      child: const Text(
                        "Year",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    CustomTextField(controller: yearController)
                  ]),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 6),
                      child: const Text(
                        "Department",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    CustomTextField(controller: deptController)
                  ]),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableButton(
                onPressed: () {
                  Map<String, dynamic> userData = {
                    "College": collegeController.text,
                    "Year": yearController.text,
                    "Department": deptController.text,
                    "Name": nameController.text,
                    "Uid": FirebaseAuth.instance.currentUser!.uid,
                  };
                  CloudService().addUserInfo(userData);
                },
                text: "Save",
              ),
              ReusableButton(
                // onPressed: () => showBottomSheet(context: context, builder: ),
                text: "Add Badges",
              ),
            ],
          ),
        ),
      ],
    );
  }

  DocumentReference docref = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  getMyInfo() async {
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        nameController.text = data['Name'];
        yearController.text = data['Year'];
        collegeController.text = data['College'];
        deptController.text = data['Department'];
        Fluttertoast.showToast(msg: data['Name']);
      });
    }
  }

  @override
  void initState() {
    getMyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ,
      backgroundColor: Color(0xff6991F1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Image.asset(
              "assets/images/Group 10.png",
              fit: BoxFit.fitWidth,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myprof ? myProfile() : searchperson(context),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!myprof) {
                                setState(() {
                                  myprof = true;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: myprof
                                      ? Color(0xFF2757C5)
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: myprof
                                          ? Colors.white
                                          : Colors.white24,
                                      width: 3)),
                              child: Image(
                                image: AssetImage("assets/images/user.png"),
                                color: myprof ? Colors.white : Colors.white24,
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (myprof) {
                                setState(() {
                                  myprof = false;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !myprof
                                      ? Color(0xFF2757C5)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: !myprof
                                          ? Colors.white
                                          : Colors.white24,
                                      width: 3)),
                              child: Image(
                                image:
                                    AssetImage("assets/images/usergroup.png"),
                                color: !myprof ? Colors.white : Colors.white24,
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

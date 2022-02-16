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
import 'package:classmates/components/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
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
      backgroundColor: const Color(0xff6991F1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/Group 10.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myprof ? myProfile() : searchperson(context),
                    const SizedBox(
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
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: myprof
                                      ? const Color(0xFF2757C5)
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: myprof
                                          ? Colors.white
                                          : Colors.white24,
                                      width: 3)),
                              child: Image(
                                image:
                                    const AssetImage("assets/images/user.png"),
                                color: myprof ? Colors.white : Colors.white24,
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !myprof
                                      ? const Color(0xFF2757C5)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: !myprof
                                          ? Colors.white
                                          : Colors.white24,
                                      width: 3)),
                              child: Image(
                                image: const AssetImage(
                                    "assets/images/usergroup.png"),
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

  Widget myProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
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
              child: const UserAvatar(),
              onTap: () {
                _image1 = ImageScreen().showPicker(context);
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 5),
              child: const Text(
                "Badges",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 6),
          child: const Text(
            "Name",
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
          ),
        ),
        CustomTextField(
          controller: nameController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 6),
          child: const Text(
            "College",
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
          ),
        ),
        CustomTextField(
          controller: collegeController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 6),
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
                      padding: const EdgeInsets.only(left: 6),
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
        const SizedBox(
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
              const ReusableButton(
                // onPressed: () => showBottomSheet(context: context, builder: ),
                text: "Add Badges",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchperson(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Center(
        child: Text(
          "Search User",
          style: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
      Container(
        padding: const EdgeInsets.only(left: 6),
        child: const Text(
          "College",
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
        ),
      ),
      CustomTextField(
        controller: collegesearchController,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(left: 6),
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
              padding: const EdgeInsets.only(left: 6),
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
        padding: const EdgeInsets.only(left: 6),
        child: const Text(
          "Class",
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: borderRadius10,
            color: Colors.white,
            boxShadow: const [
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
      const SizedBox(
        height: 25,
      ),
      const Center(
        child: ReusableButton(
          text: "Invite",
        ),
      ),
    ]);
  }
}

import 'package:classmates/components/image_picker.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/components/textfield_with_list.dart';
import 'package:classmates/components/user_avatar.dart';
import 'package:classmates/components/user_display_card.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/models/user_model.dart';
import 'package:classmates/screens/sheets/add_badges_sheet.dart';
import 'package:classmates/services/cloud_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController inviteController = TextEditingController();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? url;
  List<String>? unilist = [];
  List<String>? deptlist = [];
  List<String>? yearlist = [];
  List<Userprofile> userprof = [];

  DocumentReference docref = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  getMyInfo() async {
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        if (data.containsKey("Name")) nameController.text = data['Name'];
        if (data.containsKey("Year")) yearController.text = data['Year'];
        if (data.containsKey("College")) {
          collegeController.text = data['College'];
        }
        if (data.containsKey("Department")) {
          deptController.text = data['Department'];
        }
        if (data.containsKey("image1url")) url = data['image1url'];
      });
    }
  }

  getlist() async {
    var list = await FirebaseFirestore.instance
        .collection("CollegeList")
        .doc("evwEgeh5wLuTMclucINh")
        .get();
    if (list.exists) {
      Map<String, dynamic>? data = list.data();
      setState(() {
        for (int i = 0; i < data!['list'].length; i++) {
          unilist?.add(data['list'][i]);
        }
      });
    }

    var list2 = await FirebaseFirestore.instance
        .collection("DepartmentList")
        .doc("dept")
        .get();
    if (list2.exists) {
      Map<String, dynamic>? data = list2.data();
      setState(() {
        for (int i = 0; i < data!['deptlist'].length; i++) {
          deptlist?.add(data['deptlist'][i]);
        }
      });
    }

    var list3 = await FirebaseFirestore.instance
        .collection("YearList")
        .doc("yearlist")
        .get();
    if (list3.exists) {
      Map<String, dynamic>? data = list3.data();
      setState(() {
        for (int i = 0; i < data!['yearlist'].length; i++) {
          yearlist?.add(data['yearlist'][i]);
        }
      });
    }
  }

  getsearchlist(String College, String Year, String Dept) async {
    var docsnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where(
          "College",
          isEqualTo: College,
        )
        .where("Year", isEqualTo: Year)
        .where("Department", isEqualTo: Dept)
        .get();
    if (docsnapshot.docs.isNotEmpty) {
      setState(() {
        for (int i = 0; i < docsnapshot.docs.length; i++) {
          userprof.add(Userprofile(
              docsnapshot.docs.elementAt(i).data()['image1url'],
              docsnapshot.docs.elementAt(i).data()['Name']));
          Fluttertoast.showToast(msg: userprof.length.toString());
        }
      });
    }
  }

  @override
  void initState() {
    getMyInfo();
    getlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 75.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
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
                            color: myprof ? Colors.white : Colors.white24,
                            width: 3)),
                    child: Image(
                      image: const AssetImage("assets/images/user.png"),
                      color: myprof ? Colors.white : Colors.white24,
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
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
                            color: !myprof ? Colors.white : Colors.white24,
                            width: 3)),
                    child: Image(
                      image: const AssetImage("assets/images/usergroup.png"),
                      color: !myprof ? Colors.white : Colors.white24,
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff6991F1),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/Group 10.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: myprof ? myProfile() : searchperson(context),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget myProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "My Profile",
            style: roboto36white,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: const UserAvatar(),
              onTap: () {
                ImageScreen().showPicker(context);
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
          child: Text(
            "Name",
            style: roboto20white,
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
          child: Text(
            "College",
            style: roboto20white,
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
                      child: Text(
                        "Year",
                        style: roboto20white,
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
                      child: Text(
                        "Department",
                        style: roboto20white,
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
              ReusableButton(
                text: "Add Badges",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    builder: (context) => const AddBadgesSheet(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchperson(BuildContext context) {
    const String inviteLink = "";
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
      TextfieldList(
        controller: collegesearchController,
        list: unilist,
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
            TextfieldList(
              controller: yearsearchController,
              list: yearlist,
            )
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
            TextfieldList(
              controller: deptsearchController,
              list: deptlist,
            )
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
        child: ListView.builder(
            shrinkWrap: false,
            itemCount: userprof.length,
            itemBuilder: (BuildContext context, int index) {
              return UserCard(
                  name: userprof[index].name, url: userprof[index].url);
            }),
        width: MediaQuery.of(context).size.width,
      ),
      const SizedBox(
        height: 25,
      ),
      Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius10,
            ),
            child: const Text(
              inviteLink,
              style: roboto18regular,
            ),
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableButton(
                text: "Search",
                onPressed: () async {
                  getsearchlist(collegesearchController.text,
                      yearsearchController.text, deptsearchController.text);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ReusableButton(
                text: "Copy Invite Link",
                onPressed: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: inviteLink),
                  );
                },
              ),
            ],
          )),
        ],
      ),
    ]);
  }
}

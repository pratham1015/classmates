import 'package:classmates/components/image_picker.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/components/user_avatar.dart';
import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key, this.name, this.college, this.year, this.dept})
      : super(key: key);

  final dynamic name, college, year, dept;

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 5),
                  child: const Text(
                    "Badges",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                // Badges(badgeList: badgeList,),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            "Name",
            style: roboto20white,
          ),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius10,
          ),
          child: Text(
            name,
            style: roboto18regular,
          ),
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
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius10,
          ),
          child: Text(
            college,
            style: roboto18regular,
          ),
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
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius10,
                    ),
                    child: Text(
                      year,
                      style: roboto18regular,
                    ),
                  ),
                ],
              ),
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
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius10,
                    ),
                    child: Text(
                      dept,
                      style: roboto18regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ReusableButton(
            text: "Go Back",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

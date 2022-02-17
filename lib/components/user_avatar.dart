// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({this.profilePic, Key? key}) : super(key: key);

  final String? profilePic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Stack(
        children: [
          profilePic == null
              ? Container(
                  width: 120,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/profile.png"))))
              : Container(
                  width: 120,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(profilePic!))))
        ],
      ),
    );
  }
}

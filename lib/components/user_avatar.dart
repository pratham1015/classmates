// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({this.profilePic, Key? key}) : super(key: key);

  final String? profilePic;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5)),
              child: CircleAvatar(
                radius: 58,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            profilePic != null
                ? CircleAvatar(
                    radius: 58,
                    backgroundImage: NetworkImage(profilePic!),
                  )
                : Container(),
          ],
        ),
      );
}

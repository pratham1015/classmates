import 'package:classmates/components/user_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  String? name;
  String? url;
  String? skills;

  UserCard({Key? key, this.name, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          UserAvatar(profilePic: url),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name!,
                style: TextStyle(fontSize: 20),
              ),
              Text("No Skills")
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  const Badges({Key? key, required this.badgeList}) : super(key: key);
  final List<String> badgeList;

  @override
  Widget build(BuildContext context) {
    List<SingleBadge> badges = List.generate(
      badgeList.length,
      (index) => SingleBadge(
        badgeName: badgeList[index],
      ),
    );
    int len = (badgeList.length / 3).ceil();
    return Column(
      children: [
        (len > 0)
            ? Row(
                children: badges.sublist(
                  0,
                  min(2, badgeList.length),
                ),
              )
            : Container(),
        (len > 1)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: badges.sublist(
                    3,
                    min(5, badgeList.length),
                  ),
                ),
              )
            : Container(),
        (len > 2)
            ? Row(
                children: badges.sublist(
                  6,
                  min(8, badgeList.length),
                ),
              )
            : Container(),
      ],
    );
  }
}

class SingleBadge extends StatelessWidget {
  final String badgeName;

  const SingleBadge({Key? key, required this.badgeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius10,
      ),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          badgeName,
          style: roboto18regular,
        ),
      ),
    );
  }
}

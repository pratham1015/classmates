import 'package:flutter/material.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
        color: Color(0xFF3B5DAF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9.0),
          topRight: Radius.circular(9.0),
          bottomLeft: Radius.circular(9.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: const BackButton(
        color: Colors.black,
      ),
    );
  }
}

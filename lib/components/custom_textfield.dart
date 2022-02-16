import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.isObscure,
    this.autofocus,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? isObscure;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius10,
      ),
      child: TextField(
        controller: controller,
        autofocus: autofocus ?? false,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: borderRadius10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius10,
            borderSide: const BorderSide(
              color: Color(0xFF004FAC),
            ),
          ),
        ),
      ),
    );
  }
}

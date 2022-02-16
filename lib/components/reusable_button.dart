import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReusableButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Widget? child;
  final Function()? onPressed;

  const ReusableButton(
      {Key? key, this.text, this.color, this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius10,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F214B),
              Color(0xFF2757C5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: 150,
        height: 45.0,
        child: Center(
          child: child ??
              Text(
                text!,
                style: roboto18bold.copyWith(
                  color: color ?? Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}

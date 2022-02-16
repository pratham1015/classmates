import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: Text(
                  "Send Password Reset Email",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Email",
                style: roboto18regular,
              ),
              CustomTextField(
                controller: emailController,
                autofocus: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Dismiss",
                        style: roboto18bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                    child: ReusableButton(
                      text: "Reset Password",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

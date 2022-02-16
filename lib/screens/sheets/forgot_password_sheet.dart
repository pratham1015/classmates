import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 300.0,
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
                  SizedBox(
                    width: 200,
                    child: ReusableButton(
                      text: "Reset Password",
                      onPressed: () async {
                        try {
                          await authService
                              .sendPasswordResetEmail(
                                  context, emailController.text)
                              .then(
                                (_) => Fluttertoast.showToast(
                                  msg: "Password Reset Mail Sent",
                                ),
                              );
                          Navigator.pop(context);
                        } on Exception catch (error) {
                          Fluttertoast.showToast(
                            msg: error.toString(),
                          );
                        }
                      },
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

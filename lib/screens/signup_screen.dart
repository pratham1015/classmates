import 'package:classmates/components/back_button.dart';
import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/screens/home_screen.dart';
import 'package:classmates/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/pageillustration.png",
                  fit: BoxFit.fitWidth,
                ),
                const Backbutton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Create Account",
                  style: roboto36bold,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Email",
                        style: roboto18regular,
                      ),
                      CustomTextField(
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Password",
                        style: roboto18regular,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        isObscure: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: ReusableButton(
                    text: "Register",
                    onPressed: () async {
                      try {
                        await authService
                            .createUserWithEmailAndPassword(context,
                                emailController.text, passwordController.text)
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: "Account created successfully");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        });
                      } on Exception catch (error) {
                        Fluttertoast.showToast(msg: error.toString());
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:classmates/components/back_button.dart';
import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/screens/home_screen.dart';
import 'package:classmates/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  "Login Now",
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
                SizedBox(
                  height: 30.0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (context) {
                            TextEditingController emailController =
                                TextEditingController();

                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                          },
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ReusableButton(
                    text: "Login",
                    onPressed: () async {
                      await authService
                          .signInWithEmailAndPassword(
                              emailController.text, passwordController.text)
                          .whenComplete(() {
                        Fluttertoast.showToast(msg: "Login Success");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

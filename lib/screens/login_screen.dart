import 'package:classmates/components/back_button.dart';
import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/screens/home_screen.dart';
import 'package:classmates/screens/sheets/forgot_password_sheet.dart';
import 'package:classmates/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

                            return ForgotPasswordSheet(
                                emailController: emailController);
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
                      try {
                        await authService
                            .signInWithEmailAndPassword(
                                context,
                                emailController.text.trim(),
                                passwordController.text.trim())
                            .then((value) {
                          Fluttertoast.showToast(msg: "Signed In Sucessfully");
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

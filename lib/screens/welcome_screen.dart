import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:classmates/screens/login_screen.dart';
import 'package:classmates/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/images/pageillustration.png",
            fit: BoxFit.fitWidth,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Classmates",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/images/classmatesill.png",
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  ReusableButton(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Center(
                child: SizedBox(
                  width: 250.0,
                  child: ReusableButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/googleicon.png",
                          fit: BoxFit.scaleDown,
                          height: 30.0,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Sign Up with Google",
                          style: roboto18white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
            ],
          )
        ],
      ),
    );
  }
}

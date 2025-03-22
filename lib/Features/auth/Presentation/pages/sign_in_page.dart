import 'package:flutter/material.dart';
import '../Widget/back_grond.dart';
import '../Widget/bloc_form.dart';
import '../Widget/toptext.dart';
import '../Widget/undre_line_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Background image
            const Backgrond(),

            // Form content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App title
                const Toptext(text: "Team App"),

                const Spacer(),
                // Form
                const BlocForm(buttonText: 'sign-in', x: 0),

                // Spacer to push the "Create your account" text to the bottom
                const Spacer(),
                // Create Account Text centered at the bottom
                Undrelinetext(
                  text: "create your acount",
                  fun: () {
                    Navigator.pushNamed(context, '/LogIn');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

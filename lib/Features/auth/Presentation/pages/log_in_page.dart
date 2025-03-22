import 'package:flutter/material.dart';
import 'package:teamapp/Features/auth/Presentation/Widget/bloc_form.dart';
import '../Widget/back_grond.dart';
import '../Widget/toptext.dart';
import '../Widget/undre_line_text.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            const Backgrond(),

            // Form content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // App title
                const Toptext(text: "create your acount "),

                const Spacer(),
                //name
                // TextFiled(controller: null, validator: (value) {  }, labilText: '',),
                // Form for email and password
                const BlocForm(buttonText: 'log-in', x: 1),
                // Formm(
                //   buttonText: 'log-in',
                //   x: 1,
                // ),
                // Spacer to push the "Create your account" text to the bottom
                const Spacer(),
                // Create Account Text centered at the bottom
                Undrelinetext(
                  text: "back to main page",
                  fun: () {
                    Navigator.pushNamed(context, '/SignIn');
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/auth/Presentation/state_mangment/bloc/auth_event.dart';
import '../state_mangment/bloc/auth_bloc.dart';
import 'vildate_form.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.buttonText,
    required this.formKey,
    required this.name,
    required this.email,
    required this.passWord,
  });
  final String buttonText;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController passWord;
  final Vildateform vildateform = Vildateform();
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFF7F5AF0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.1,
            ),
          ),
          onPressed: () async {
            await onPrssedFun(context);
          },
          child: Text(
            buttonText.toUpperCase(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPrssedFun(BuildContext context) async {
    if (buttonText == 'continue') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You didn't verify yet"),
          duration: Duration(seconds: 8),
        ),
      );
      Navigator.pushNamed(context, '/');
    } else if (formKey.currentState?.validate() ?? false) {
      if (buttonText == 'sign-in') {
        BlocProvider.of<AuthBloc>(context)
            .add(SignInEvent(email: email.text, password: passWord.text));
      }
      if (buttonText == 'log-in') {
        BlocProvider.of<AuthBloc>(context).add(CreateAccountEvent(
            email: email.text, password: passWord.text, name: name.text));
      }
    }
  }
}

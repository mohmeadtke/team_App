import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/auth/Presentation/state_mangment/bloc/auth_event.dart';
import '../state_mangment/bloc/auth_bloc.dart';
import 'vildate_form.dart';

//helo 7
// helow 88888
// 9

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
  // final Function submitForm;
  final Vildateform vildateform = Vildateform();
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 129, 129, 123), // background color
          ),
          onPressed: () async {
            await onPrssedFun(context);
          },
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> onPrssedFun(BuildContext context) async {
    if (buttonText == 'continue') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "u didnt verifie yet "), // Use the state.message as the content
          duration: Duration(seconds: 8),
        ),
      );
      Navigator.pushNamed(context, '/');

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => UserFormPage(),
      //     ));
    } else if (formKey.currentState?.validate() ?? false) {
      if (buttonText == 'sign-in') {
        BlocProvider.of<AuthBloc>(context)
            .add(SignInEvent(email: email.text, password: passWord.text));
      }
      if (buttonText == 'log-in') {
        BlocProvider.of<AuthBloc>(context).add(CreateAccountEvent(
            email: email.text, password: passWord.text, name: name.text));

        // BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
      }
    }
  }
}

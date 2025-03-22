import 'package:flutter/material.dart';
import 'button_text.dart';
import 'text_filed.dart';
import 'vildate_form.dart';

class Formm extends StatelessWidget {
  Formm({
    super.key,
    required this.buttonText,
    required this.x,
  });
  final Vildateform vildateform = Vildateform();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String buttonText;
  final _formKey = GlobalKey<FormState>();
  final int x;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // child: Stack(
      //   children: [
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //name TextField with validation
          if (x == 1)
            TextFiled(
              controller: _nameController,
              validator: (value) {
                return vildateform.validatePassword(value);
              },
              labilText: 'Enter your name',
            ),
          // Email TextField with validation
          TextFiled(
            controller: _emailController,
            validator: (value) {
              return vildateform.validateEmail(value);
            },
            labilText: 'Enter your Email',
          ),
          // Password TextField with validation
          TextFiled(
            controller: _passwordController,
            validator: (value) {
              return vildateform.validatePassword(value);
            },
            labilText: 'Enter your Password',
          ),
          // Submit Button
          Button(
            buttonText: buttonText,
            formKey: _formKey,
            name: _nameController,
            email: _emailController,
            passWord: _passwordController,
          ),
        ],
      ),
      //   ],
      // ),
    );
  }
}

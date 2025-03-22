import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state_mangment/bloc/auth_bloc.dart';
import '../state_mangment/bloc/auth_state.dart';
import 'form.dart';

class BlocForm extends StatelessWidget {
  const BlocForm({super.key, required this.buttonText, required this.x});
  final String buttonText;
  final int x;
  //Happe New Year
  //happe the next day of the new year
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(context).pushReplacementNamed('/');
        }
        if (state is FailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.message), // Use the state.message as the content
              duration: const Duration(seconds: 8),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (state is SuccessState) {
          return const Text("");
        } else if (state is FailureState) {
          return Formm(
            buttonText: buttonText,
            x: x,
          );
        }
        //this is the inital state so i should retrun someting
        else {
          return Formm(
            buttonText: buttonText,
            x: x,
          );
        }
      },
    );
  }
}

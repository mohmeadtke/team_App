import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _navigated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            if (!_navigated) {
              _navigated = true;

              WidgetsBinding.instance.addPostFrameCallback((_) async {
                if (user != null) {
                  await user.reload(); // Force refresh user info
                  final refreshedUser = FirebaseAuth.instance.currentUser;

                  if (refreshedUser!.emailVerified) {
                    Navigator.pushReplacementNamed(context, '/mainPage');
                  } else {
                    Navigator.pushReplacementNamed(context, '/Verifie');
                  }
                } else {
                  Navigator.pushReplacementNamed(context, '/SignIn');
                }
              });
            }

            return const SizedBox(); // Or splash screen
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

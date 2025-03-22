import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/auth/Presentation/pages/log_in_page.dart';
import 'package:teamapp/Features/auth/Presentation/pages/verifie_page.dart';
import 'package:teamapp/Features/main/main_page.dart';
import 'package:teamapp/auth_check.dart';
import 'package:teamapp/testpage.dart';
import 'Features/auth/Presentation/pages/sign_in_page.dart';
import 'Features/auth/Presentation/state_mangment/bloc/auth_bloc.dart';
import 'ingectchin.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: UserFormPage(
      //   teamRepo: di.sl(),
      // ),
      routes: {
        '/': (context) => const Auth(),
        '/SignIn': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: const SignInPage(),
            ),
        '/LogIn': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: const LogInPage(),
            ),
        '/Verifie': (context) => BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: VerifiePage(),
            ),
        '/mainPage': (context) => const MainPage(),
        '/testPage': (context) => const Testpage()
      },
    );
  }
}

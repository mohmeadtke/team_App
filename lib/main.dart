import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamapp/Features/Create%20Team/Presentation/pages/create_team_page.dart';
import 'package:teamapp/Features/Create%20Team/Presentation/state_mangment/bloc/create_team_bloc.dart';
import 'package:teamapp/Features/auth/Presentation/pages/log_in_page.dart';
import 'package:teamapp/Features/auth/Presentation/pages/verifie_page.dart';
import 'package:teamapp/Features/join%20Team/Presentation/State_mangmeant/bloc/join_team_bloc.dart';
import 'package:teamapp/Features/join%20Team/Presentation/pages/team_search_page.dart';
import 'package:teamapp/Features/main/Presentation/pages/main_page.dart';
import 'package:teamapp/Features/main/Presentation/state_mangmeant/bloc/main_page_bloc.dart';
import 'package:teamapp/Features/profile/Presentation/state_mangmeant/bloc/profile_bloc.dart';
import 'package:teamapp/auth_check.dart';
import 'package:teamapp/core/localDataSaved/user_data_local_storge.dart';
import 'Features/auth/Presentation/pages/sign_in_page.dart';
import 'Features/auth/Presentation/state_mangment/bloc/auth_bloc.dart';
import 'ingectchin.dart' as di;

//some code
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  UserDataCache().startUserStream();

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<ProfileBloc>()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
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
            // '/testPage': (context) => di.sl<Testpage>(),ProfileBloc,
            '/mainPage': (context) => BlocProvider(
                  create: (context) => di.sl<MainPageBloc>(),
                  child: const MainPage(),
                ),
            '/createTeamPage': (context) => BlocProvider(
                  create: (context) => di.sl<CreateTeamBloc>(),
                  child: const CreateTeamPage(),
                ),
            '/joinTeamPage': (context) => BlocProvider(
                  create: (context) => di.sl<JoinTeamBloc>(),
                  child: const TeamSearchPage(),
                )
          },
        ));
  }
}

import 'package:authentication_app/auth/providers/auth_cubit.dart';
import 'package:authentication_app/presentation/pages/main_page.dart';
import 'package:authentication_app/presentation/pages/sign_in_page.dart';
import 'package:authentication_app/presentation/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SignUpPage(),
          '/sign-ip': (context) => const SignInPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web_auth/theme/colors.dart';
import 'package:web_auth/views/auth/login_page.dart';
import 'package:web_auth/views/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColors.deepTeal),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/signuppage': (context) => SignupPage()
      },
    );
  }
}

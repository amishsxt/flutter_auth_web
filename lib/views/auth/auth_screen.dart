import 'package:flutter/material.dart';
import 'package:web_auth/views/auth/register_screen.dart';
import 'package:web_auth/views/auth/signin_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SignInPage(onRegisterTap: _showRegisterPage),
          RegisterScreen(onSignInTap: _showSignInPage),
        ],
      ),
    );
  }

  void _showRegisterPage() {
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _showSignInPage() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback onRegisterTap;

  SignInPage({required this.onRegisterTap});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // State variable to control password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                counterText: '', // Hide character counter
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 50, // Limit input to 50 characters
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggle visibility
                    });
                  },
                ),
                counterText: '', // Hide character counter
              ),
              maxLength: 50, // Limit input to 50 characters
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              // Sign in logic here
              String email = _emailController.text;
              String password = _passwordController.text;
              print('Sign In - Email: $email, Password: $password');
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(250, 50),
            ),
          ),
          TextButton(
            onPressed: widget.onRegisterTap,
            child: Text('Don\'t have an account? Register here'),
          ),
        ],
      ),
    );
  }
}

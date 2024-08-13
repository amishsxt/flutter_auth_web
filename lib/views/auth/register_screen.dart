import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onSignInTap;

  RegisterScreen({required this.onSignInTap});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
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
            'Register',
            style: TextStyle(
              fontSize: 32.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                counterText: '', // Hide character counter
              ),
              maxLength: 50, // Limit input to 50 characters
            ),
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
              // Register logic here
              String name = _nameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;
              print(
                  'Register - Name: $name, Email: $email, Password: $password');
            },
            child: Text(
              'Register',
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
          SizedBox(height: 20.0), // Add space above the TextButton
          TextButton(
            onPressed: widget.onSignInTap,
            child: Text('Already have an account? Sign In here'),
          ),
        ],
      ),
    );
  }
}

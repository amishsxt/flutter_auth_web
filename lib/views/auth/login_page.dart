import 'package:flutter/material.dart';
import 'package:web_auth/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: rightCard()),
                  const SizedBox(width: 5.0),
                  Expanded(child: leftCard()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rightCard() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: SizedBox(
          width: 350.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat,
                color: AppColors.myGreen,
                size: 50.0,
              ),
              const SizedBox(height: 15.0),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              const Text(
                "Great to see you again",
                style: TextStyle(
                    color: AppColors.grey,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0),
              ),
              const SizedBox(height: 8.0),
              const Divider(color: Colors.grey),
              const SizedBox(height: 25.0),
              Text(
                "Email",
                style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.myGreen),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  counterText: '',
                  errorText: emailError, // Display error text
                ),
                maxLength: 50,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: AppColors.black),
              ),
              const SizedBox(height: 15.0),
              Text(
                "Password",
                style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.myGreen),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.grey,
                    ),
                    onPressed: _toggleVisibility,
                  ),
                  errorText: passwordError, // Display error text
                ),
                maxLength: 50,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: AppColors.black),
              ),
              const SizedBox(height: 15.0),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _handleForgotPassword,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 20),
                  ),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.myGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  TextButton(
                    onPressed: _navigateToSignUpPage,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 20),
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          color: AppColors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftCard() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.myGreen, borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: SvgPicture.asset(
        "assets/images/login.svg",
      )),
    );
  }

  void _handleLogin() {
    setState(() {
      // Clear previous errors
      emailError = null;
      passwordError = null;

      // Validate email
      if (emailController.text.isEmpty) {
        emailError = 'Email is required';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
          .hasMatch(emailController.text)) {
        emailError = 'Enter a valid email address';
      }

      // Validate password
      if (passwordController.text.isEmpty) {
        passwordError = 'Password is required';
      } else if (passwordController.text.length < 8) {
        passwordError = 'Password must be at least 8 characters long';
      }
    });

    // If there are no errors, proceed with the signup logic
    if (emailError == null && passwordError == null) {
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Login Successful');
    }
  }

  void _navigateToSignUpPage() {
    Navigator.pushNamed(context, '/signuppage');
  }

  void _handleForgotPassword() {}
}

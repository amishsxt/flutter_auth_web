import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_auth/theme/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? nameError;
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
                  Expanded(child: leftCard()),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: rightCard(),
                  ),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.chat,
                  color: AppColors.myGreen,
                  size: 50.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
                const Text(
                  "Let's create your account",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0),
                ),
                const SizedBox(height: 5.0),
                const Divider(thickness: 0.3, color: Colors.grey),
                const SizedBox(height: 25.0),
                const Text(
                  "Name",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      errorText: nameError, // Display the name error
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.myGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      counterText: ''),
                  maxLength: 50,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: AppColors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      errorText: emailError, // Display the email error
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.myGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      counterText: ''),
                  maxLength: 50,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppColors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      errorText: passwordError, // Display the password error
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.myGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      counterText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grey,
                        ),
                        onPressed: _toggleVisibility,
                      )),
                  maxLength: 50,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: AppColors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.myGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                          color: AppColors.grey,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                    TextButton(
                      onPressed: _navigateToLoginPage,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 20),
                      ),
                      child: const Text(
                        "LogIn",
                        style: TextStyle(
                            color: AppColors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    )
                  ],
                )
              ],
            ),
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
          "assets/images/signup.svg",
        )));
  }

  void _handleSignUp() {
    setState(() {
      // Clear previous errors
      nameError = null;
      emailError = null;
      passwordError = null;

      // Validate name
      if (nameController.text.isEmpty) {
        nameError = 'Name is required';
      }

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
    if (nameError == null && emailError == null && passwordError == null) {
      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Signup Successful');

      _showSignUpSuccessDialog();
    }
  }

  void _showSignUpSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Signup Successful"),
          content: const Text("Your account has been created successfully!"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToLoginPage() {
    Navigator.pushNamed(context, '/loginpage');
  }
}

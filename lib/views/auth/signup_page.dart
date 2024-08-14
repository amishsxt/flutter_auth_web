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
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.all(10.0),
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
    ;
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
                Icon(
                  Icons.chat,
                  color: AppColors.myGreen,
                  size: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
                Text(
                  "Let's create your account",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 0.2,
                    color: AppColors.grey,
                  ),
                ),
                Container(
                  height: 25.0,
                ),
                Text(
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.myGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      counterText: ''),
                  maxLength: 50,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: AppColors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.myGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      counterText: ''),
                  maxLength: 50,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: AppColors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
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
                  style: TextStyle(color: AppColors.black),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
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
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                        minimumSize: Size(0, 20),
                      ),
                      child: Text(
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

  void _handleSignUp() {}

  void _navigateToLoginPage() {
    Navigator.pushNamed(context, '/loginpage');
  }
}

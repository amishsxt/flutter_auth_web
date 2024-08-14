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
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

  Widget leftCard() {
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
                    "Welcome Back",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                ),
                Text(
                  "Great to see you again",
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
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _handleForgotPassword,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 20),
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
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.myGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
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
                SizedBox(
                  height: 15.0,
                ),
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
                      onPressed: _handleSignUp,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 20),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rightCard() {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.myGreen, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: SvgPicture.asset(
          "assets/images/login.svg",
        )));
  }

  void _handleLogin() {}

  void _handleSignUp() {}

  void _handleForgotPassword() {}
}

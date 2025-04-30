import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hdfc_reimagine/features/dashborad/dashboard_screen.dart';
import 'package:hdfc_reimagine/routes/app_routes.dart';
import 'package:hdfc_reimagine/utills/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong password provided.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hdfcLogo(),
                SizedBox(height: 18),
                welcomeText(),
                SizedBox(height: 18),
                lockText(),
                SizedBox(height: 18),
                _emaildField(),
                SizedBox(height: 18),
                _passwordField(),
                SizedBox(height: 18),
                loginButton(),
                SizedBox(height: 18),
                addText(),
                SizedBox(height: 50),
                finger_button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget hdfcLogo() {
    return Image.asset(
      "assets/images/hdfclogo.png",
      height: 150,
    );
  }

  Widget welcomeText() {
    return Text(
      "Welcome John D`Souza",
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
    );
  }

  Widget lockText() {
    return Text(
      "Enter Password to Unlock",
      style: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget _emaildField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Enter email",
            labelStyle: TextStyle(color: AppColors.primaryBlue),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 1),
            )),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Enter Password",
            labelStyle: TextStyle(color: AppColors.primaryBlue),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 1),
            )),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget loginButton() {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          login();
        }
      },
      child: Text(
        "Login using email & password",
        style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 15,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget addText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not John D`Souza?",
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signup);
          },
          child: Text(
            "Add another user",
            style: TextStyle(
                color: AppColors.secondaryBlue,
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget finger_button() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.dashboard);
      },
      child: Icon(
        Icons.fingerprint,
        size: 80,
        color: AppColors.darkGrey,
      ),
    );
  }
}

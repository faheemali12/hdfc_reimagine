import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hdfc_reimagine/routes/app_routes.dart';
import 'package:hdfc_reimagine/utills/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          scrollDirection: Axis.vertical  ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hdfcLogo(),
              SizedBox(height: 18),
              welcomeText(),
              SizedBox(height: 18),
              lockText(),
              SizedBox(height: 18),
              otpField(),
              SizedBox(height: 18),
              loginButton(),
              SizedBox(height: 18),
              addText(),
              SizedBox(height: 50),
              finger_button()
            ],
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
      "Enter 4 digit lock PIN",
      style: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget otpField() {
    return OtpTextField(
      clearText: true,
      numberOfFields: 4,
      showFieldAsBox: false,
      borderColor: Colors.black,
      filled: true,
      enabledBorderColor: Colors.black,
      borderWidth: 2.0,
    );
  }

  Widget loginButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Login using password",
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
        Text(
          "Add another user",
          style: TextStyle(
              color: AppColors.secondaryBlue,
              fontSize: 13,
              fontWeight: FontWeight.w600),
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

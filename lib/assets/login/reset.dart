import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/reset.dart';

class resetpassword extends StatelessWidget {
  static String routname = "reset";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
            Navigator.pop(context); // Navigate back or to another screen
          } else if (state is ResetPasswordFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 100,
                    color: maincolor,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                "Reset Password",
                style: TextStyle(
                    color: maincolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Please Enter Your Email Address",
                    style: TextStyle(color: maincolor, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                  emailController, "Email", "Please Enter Your Email",
                  isEmail: true),
              SizedBox(height: 20),
              _buildTextFormField(
                  newPasswordController, "New Password", "Enter New Password",
                  obscureText: true),
              SizedBox(height: 20),
              _buildTextFormField(confirmPasswordController, "Confirm Password",
                  "Confirm Your Password",
                  obscureText: true),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _resetPassword(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 63, 154, 152),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 13.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context) {
    final email = emailController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (email.isNotEmpty &&
        newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (newPassword == confirmPassword) {
        context.read<AuthCubit>().resetPassword(
              email: email,
              newPassword: newPassword,
              confirmPassword: confirmPassword,
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Passwords do not match.'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill in all fields.'),
      ));
    }
  }

  Widget _buildTextFormField(
      TextEditingController controller, String label, String hint,
      {bool obscureText = false, bool isEmail = false}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          labelText: label,
          labelStyle: TextStyle(color: maincolor, fontSize: 15),
          hintText: hint,
          hintStyle: TextStyle(color: maincolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: maincolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: maincolor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: maincolor),
          ),
        ),
      ),
    );
  }
}

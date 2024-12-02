import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/reset.dart';

class VerificationCodePage extends StatelessWidget {
  static String routname = "verification";
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification Code", style: TextStyle(color: maincolor)),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is VerificationSuccessState) {
            // Navigate to the Reset Password Page on successful verification
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ));
            Navigator.pushNamed(context, resetpassword.routname);
          } else if (state is VerificationFailedState) {
            // Show error message on failure
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Icon(
                  Icons.security,
                  size: 100,
                  color: maincolor,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Enter the verification code sent to your email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: maincolor),
                ),
              ),
              SizedBox(height: 20),
              _buildTextFormField(
                controller: codeController,
                label: "Verification Code",
                hint: "Enter the code received",
              ),
              SizedBox(height: 30),
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  if (state is VerificationLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: maincolor,
                      ),
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _verifyCode(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maincolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 13.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyCode(BuildContext context) {
    final code = codeController.text;

    if (code.isNotEmpty) {
      context.read<AuthCubit>().verifyCode(code: code);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Please enter the verification code.',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: maincolor,
      ));
    }
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
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

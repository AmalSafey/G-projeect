/*import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/home/home.dart';

class Logindesign extends StatefulWidget {
  static String routname = "Login";

  @override
  State<Logindesign> createState() => _LogindesignState();
}

class _LogindesignState extends State<Logindesign> {
  void _showDialog(BuildContext context, String message,
      {VoidCallback? onClose}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          style: TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // يغلق التنبيه فقط
              if (onClose != null) {
                onClose(); // يتم تنفيذ هذا فقط إذا كان هناك إجراء معين بعد الإغلاق
              }
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Color.fromARGB(255, 112, 182, 182),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Log in',
              style: TextStyle(
                color: maincolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: maincolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Sign in to your account",
                        style: TextStyle(
                          color: maincolor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      email,
                      "Email",
                      "Enter Your Email",
                      isEmail: true,
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      password,
                      "Password",
                      "Enter Your Password",
                      isPassword: true,
                      obscureText: true,
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: validateForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: maincolor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 13.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        child: Text(
                          state is LoginLoadingState ? "Loading..." : 'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ForgetPassword.routname);
                          },
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 112, 182, 182),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            color: maincolor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterDesign.routeName);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: maincolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _showDialog(context, "Login successful!", onClose: () {
            Future.microtask(() {
              Navigator.pushReplacementNamed(context, homescreen.routname);
            });
          });
        } else if (state is LoginFailedState) {
          _showDialog(context, state.message);
        }
      },
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      // Trigger login only if the form is valid
      BlocProvider.of<AuthCubit>(context)
          .login(email: email.text, password: password.text);
    }
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String label,
    String hint, {
    bool obscureText = false,
    bool isEmail = false,
    bool isPassword = false,
  }) {
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          if (isEmail &&
              !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          if (isPassword && value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/abstractclass.dart';
import 'package:flutter_application_graduation/screens/hometabscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:flutter_application_graduation/home/home.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';

class Logindesign extends StatefulWidget {
  static String routname = "Login";

  @override
  State<Logindesign> createState() => _LogindesignState();
}

class _LogindesignState extends State<Logindesign> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showDialog(BuildContext context, String message,
      {VoidCallback? onClose}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          style: TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onClose != null) {
                onClose();
              }
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Color.fromARGB(255, 112, 182, 182),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          print("✅ Login successful! Token: ${state.token}");

          _showDialog(context, "Login successful!", onClose: () {
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.pushReplacementNamed(context, homescreen.routname);
            });
          });
          Navigator.pushNamed(context, hometabscreen.routname);
        } else if (state is LoginFailedState) {
          print("❌ Login failed: ${state.message}");
          _showDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Log in',
              style: TextStyle(
                color: maincolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextFormField(email, "Email", "Enter Your Email",
                      isEmail: true),
                  SizedBox(height: 20),
                  _buildTextFormField(
                      password, "Password", "Enter Your Password",
                      isPassword: true, obscureText: true),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: validateForm,
                    child: Text(
                        state is LoginLoadingState ? "Loading..." : 'Login'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(context)
          .login(email: email.text, password: password.text);
    }
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String label,
    String hint, {
    bool obscureText = false,
    bool isEmail = false,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) return 'Invalid email';
        if (isPassword && value.length < 8)
          return 'Password must be at least 8 characters';
        return null;
      },
    );
  }
}
